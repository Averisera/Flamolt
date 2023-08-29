import 'dart:convert';
import 'dart:math';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flamolt/components/chat.dart';
import 'package:flamolt/components/firestore_methods.dart';
import 'package:flamolt/components/user.dart';
import 'package:flamolt/constants.dart';
import 'package:flamolt/providers/user_provider.dart';
import 'package:flamolt/screens/streampage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class AddLiveScreen extends StatefulWidget {
  final bool isBroadcasting;
  final String channelId;
  const AddLiveScreen({super.key, required this.isBroadcasting, required this.channelId});
  

  @override
  State<AddLiveScreen> createState() => _AddLiveScreenState();
}

class _AddLiveScreenState extends State<AddLiveScreen> {
  List<int> _remoteUid=[];
  bool _localUserJoined=false;
  var _uniqid= Uuid().v1();
  bool switchCamera= true;
  bool isMuted= true;
  late final RtcEngine _engine;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initEngine();
  }
  String baseUrl='https://elated-bison-397417.el.r.appspot.com/';
  String? token;
  Future<void> getToken() async {
    final res= await http.get(Uri.parse(baseUrl+'rtc/'+widget.channelId+'/publisher/userAccount/'+Provider.of<UserProvider>(context,listen: false).getUser.uid+'/'));
    if(res.statusCode==200){
      setState(() {
        token=res.body;
        token=jsonDecode(token!)['rtcToken'];
      });
    }
    else{
      print('Failed to get token');
    }
  }
  @override
  Widget build(BuildContext context) {
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;
    final user= Provider.of<UserProvider>(context).getUser;
    return WillPopScope(
      onWillPop: () async {
        await _leaveChannel();
        return Future.value(true);
      },
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        backgroundColor: Constants.kBlackColor,
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              _renderVideo(user),
              if('${user.uid}${user.username}'==widget.channelId)
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: _switchCamera,
                      child: const Text('Switch Camera'),
                    ),
                    InkWell(
                      onTap: _onToggleMute,
                      child: Text(isMuted? 'Unmute':'mute'),
                    )
                  ],
                ),
                Expanded(
                  child: Chat(channelId: widget.channelId),
                )
            ],
          ),
        )
      ),
    );
  }
  
  void _initEngine() async {
    _engine= createAgoraRtcEngine();
    await [Permission.microphone, Permission.camera].request();
    await _engine.initialize(const RtcEngineContext(appId: '63598c116db4469ea5e2c282f03c161e', channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,));
    _addListeners();
    await _engine.enableVideo();
    await _engine.startPreview();
    await _engine.setChannelProfile(ChannelProfileType.channelProfileLiveBroadcasting);
    if (widget.isBroadcasting){
      await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    }
    else{
      await _engine.setClientRole(role: ClientRoleType.clientRoleAudience);
    }
    await getToken();
    await _engine.joinChannelWithUserAccount(token: token!, channelId: widget.channelId, userAccount: Provider.of<UserProvider>(context,listen: false).getUser.uid);

  }
  
  void _addListeners() {
    _engine.registerEventHandler(RtcEngineEventHandler(
      onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
        debugPrint("local user ${connection.localUid} joined");
          setState(() {
            _localUserJoined = true;
          });
      },
      onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          debugPrint("remote user $remoteUid joined");
          setState(() {
            _remoteUid.add(remoteUid);
          });
        },
        onUserOffline: (RtcConnection connection, int remoteUid, UserOfflineReasonType reason) {
          debugPrint("remote user $remoteUid left channel");
          setState(() {
            _remoteUid.removeWhere((element) => element==remoteUid);
          });
        },
        onTokenPrivilegeWillExpire: (RtcConnection connection, String token) async {
          await getToken();
          await _engine.renewToken(token);
          debugPrint('[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
        },
    ));
  }

  _renderVideo(user) {
    return AspectRatio(aspectRatio: 16/9, 
    child: '${user.uid}${user.username}'==widget.channelId? AgoraVideoView(controller: VideoViewController(rtcEngine: _engine, canvas: const VideoCanvas(uid: 0))): _remoteUid.isNotEmpty? AgoraVideoView(controller: VideoViewController.remote(rtcEngine: _engine, canvas: VideoCanvas(uid: _remoteUid[0]), connection: RtcConnection(channelId: widget.channelId))): Container(),
  );
  }
  
  _leaveChannel() async {
    await _engine.leaveChannel();
    if ('${Provider.of<UserProvider>(context, listen: false).getUser.uid}${Provider.of<UserProvider>(context, listen: false).getUser.username}'==widget.channelId){
      await FirestoreMethods().endLiveStream(widget.channelId);
    }
    else{
      FirestoreMethods().updateViewCount(false, widget.channelId);
    }
    print('If this is not printed');
    Navigator.pushReplacementNamed(context, '/stream');
  }

  void _switchCamera() async {
    await _engine.switchCamera().then((value) {
      setState(() {
        switchCamera=!switchCamera;
      });
    }).catchError((err){
      debugPrint(err.toString());
    });
  }
  void _onToggleMute() async {
    setState(() {
      isMuted=!isMuted;
    });
    await _engine.muteLocalAudioStream(isMuted);
  }
}