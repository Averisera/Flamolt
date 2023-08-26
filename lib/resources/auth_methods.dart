import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthMethods{
  final FirebaseAuth _auth= FirebaseAuth.instance;
  final FirebaseFirestore _firestore= FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String username,
    required String email,
    required String password,
  }) async {
    String res='An error occured';
    try {
      if(email.isNotEmpty && username.isNotEmpty && password.isNotEmpty){
        UserCredential cred= await _auth.createUserWithEmailAndPassword(email: email, password: password);
        await _firestore.collection('users').doc(cred.user!.uid).set({
          'uid': cred.user!.uid,
          'email': email,
          'username': username,
          'followers': [],
          'following': [],
          'bio': '',
        });
        res='success';
      }
    }
    catch(err){
    res=err.toString();
    }
    return res;
  }
}