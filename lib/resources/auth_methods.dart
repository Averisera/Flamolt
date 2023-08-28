import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flamolt/components/user.dart' as model;
import 'package:flutter/material.dart';

class AuthMethods{
  final FirebaseAuth _auth= FirebaseAuth.instance;
  final FirebaseFirestore _firestore= FirebaseFirestore.instance;
  Future<model.User> getUserDetails() async {
    User currentUser=_auth.currentUser!;
    DocumentSnapshot snap= await _firestore.collection('users').doc(currentUser.uid).get();
    return model.User.fromSnap(snap);
  }
  Future<String> signUpUser({
    required String username,
    required String email,
    required String password,
  }) async {
    String res='An error occured';
    try {
      if(email.isNotEmpty && username.isNotEmpty && password.isNotEmpty){
        UserCredential cred= await _auth.createUserWithEmailAndPassword(email: email, password: password);
        model.User user= model.User(uid: cred.user!.uid, bio: '', followers: [], following: [], username: username, email: email, photoUrl: 'https://www.pngarts.com/files/10/Default-Profile-Picture-Transparent-Image.png');
        await _firestore.collection('users').doc(cred.user!.uid).set(user.toJson());
        res='success';
      }
    }
    catch(err){
    res=err.toString();
    }
    return res;
  }
  Future<String> logInUser({
    required String email,
    required String password,
  }) async {
    String res='An error occured';
    try {
      if(email.isNotEmpty && password.isNotEmpty){
        UserCredential cred= await _auth.signInWithEmailAndPassword(email: email, password: password);
        res='success';
      }
    }
    catch(err){
    res=err.toString();
    }
    return res;
  }
}