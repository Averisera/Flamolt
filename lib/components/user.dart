import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';

class User{
  final String username;
  final String email;
  final String uid;
  final String bio;
  final List followers;
  final List following;
  final String photoUrl;

  const User({required this.uid, required this.bio, required this.followers, required this.following, required this.username, required this.email, required this.photoUrl});
  Map<String, dynamic> toJson() => {
          'uid': uid,
          'email': email,
          'username': username,
          'followers': followers,
          'following': following,
          'bio': bio,
          'photoUrl': photoUrl,
  };
  static User fromSnap(DocumentSnapshot snap){
    var snapshot=snap.data() as Map<String,dynamic>;
    return User(
      uid: snapshot['uid'], 
      bio: snapshot['bio'], 
      followers: snapshot['followers'], 
      following: snapshot['following'], 
      username: snapshot['username'], 
      email: snapshot['email'],
      photoUrl: snapshot['photoUrl']
    );
  }
}