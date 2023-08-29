import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flamolt/components/livestream.dart';
import 'package:flamolt/components/post.dart';
import 'package:flamolt/components/storage_methods.dart';
import 'package:flamolt/components/user.dart' as model;
import 'package:flamolt/components/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../providers/user_provider.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> startLiveStream(
    String title, Uint8List? image, BuildContext context,
  ) async {
    String channelId='';
    final model.User user= Provider.of<UserProvider>(context, listen: false).getUser;
    try{
      if(title.isNotEmpty && image!=null){
        String thumbnailUrl= await StorageMethods().uploadImageToStorage('livestream-thumbnails', image, true);
        channelId= '${user.uid}${user.username}';
        LiveStream liveStream= LiveStream(uid: user.uid, image: thumbnailUrl, startedAt: DateTime.now(), viewers: 0, username: user.username, channelId: channelId, title: title);
        _firestore.collection('livestream').doc(channelId).set(liveStream.toJson());
      }
      else{
        showSnackBar('Please enter all fields', context);
      }
    }
    catch(e){
      showSnackBar(e.toString(), context);
    }
    return channelId;
  }

  Future<String> uploadPost(
    String description,
    Uint8List file,
    String uid,
    String username,
    String profImage,
  ) async {
    String res='some error occured';
    try{
      String postId= const Uuid().v1();
      String photoUrl = await StorageMethods().uploadImageToStorage('posts',file ,true );
      Post post= Post(uid: uid, description: description, postId: postId, postUrl: photoUrl, username: username, profImage: profImage, datePublished: DateTime.now(), likes: []);
      _firestore.collection('posts').doc(postId).set(post.toJson(),);
      res='success';
    }
    catch(e){
      res=e.toString();
    }
    return res;
  }
  Future<void> endLiveStream(String channelId) async {
    try{
      QuerySnapshot snap= await _firestore.collection('livestream').doc(channelId).collection('comments').get();
      for(int i=0; i<snap.docs.length; i++){
        await _firestore.collection('livestream').doc(channelId).collection('comments').doc((snap.docs[i].data()! as dynamic)['commentId']).delete();
      }
      await _firestore.collection('livestream').doc(channelId).delete();
    }
    catch(e){
      debugPrint(e.toString());
    }
  }

  Future<void> updateViewCount(bool isIncrease, String id) async {
    try{
      await _firestore.collection('livestream').doc(id).update({
        'viewers': FieldValue.increment(isIncrease? 1:-1)
      });
    }
    catch(e){}
  }
  Future<void> chat(String text, String id, BuildContext context) async {
    final user= Provider.of<UserProvider>(context, listen: false);
    try{
      String commentId = const Uuid().v1();
      await _firestore.collection('livestream').doc(id).collection('comments').doc(commentId).set({
        'username': user.getUser.username,
        'message': text,
        'uid': user.getUser.uid,
        'createdAt': DateTime.now(),
        'commentId':commentId
      });
    }
    on FirebaseException catch(e){
      showSnackBar(e.message!, context);
    }
  }
}