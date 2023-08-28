import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flamolt/constants.dart';
import 'package:flutter/material.dart';

class AddLiveScreen extends StatefulWidget {
  const AddLiveScreen({super.key});

  @override
  State<AddLiveScreen> createState() => _AddLiveScreenState();
}

class _AddLiveScreenState extends State<AddLiveScreen> {
  bool _localUserJoined=false;
  late final RtcEngine _engine;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initEngine();
  }
  @override
  Widget build(BuildContext context) {
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Constants.kBlackColor,
      body: Container(height: screenHeight*0.4,),
    );
  }
  
  void _initEngine() async {
    _engine= createAgoraRtcEngine();
    await _engine.initialize(const RtcEngineContext(appId: '63598c116db4469ea5e2c282f03c161e'));
    _addListeners();
  }
  
  void _addListeners() {
    _engine.registerEventHandler(RtcEngineEventHandler(
      onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
        debugPrint("local user ${connection.localUid} joined");
          setState(() {
            _localUserJoined = true;
          });
      },
    ));
  }
}