import 'package:cloud_firestore/cloud_firestore.dart';

class Post{
  final String username;
  final String description;
  final String uid;
  final String postId;
  final datePublished;
  final String profImage;
  final String postUrl;
  final likes;

  const Post({required this.uid, required this.description, required this.postId, required this.postUrl, required this.username, required this.profImage, required this.datePublished, required this.likes});
  Map<String, dynamic> toJson() => {
          'uid': uid,
          'username': username,
          'postUrl': postUrl,
          'postId': postId,
          'likes': likes,
          'datePublished': datePublished,
          'description': description,
          'profImage': profImage,
  };
  static Post fromSnap(DocumentSnapshot snap){
    var snapshot=snap.data() as Map<String,dynamic>;
    return Post(
      uid: snapshot['uid'], 
      description: snapshot['bio'], 
      postId: snapshot['followers'], 
      postUrl: snapshot['following'], 
      username: snapshot['username'], 
      profImage: snapshot['email'],
      datePublished: snapshot['photoUrl'],
      likes: snapshot['likes']
    );
  }
}