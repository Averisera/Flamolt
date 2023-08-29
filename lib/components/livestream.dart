import 'package:cloud_firestore/cloud_firestore.dart';

class LiveStream{
  final String username;
  final String image;
  final String uid;
  final String title;
  final startedAt;
  final viewers;
  final String channelId;

  const LiveStream({required this.uid, required this.image, required this.startedAt, required this.viewers, required this.username, required this.channelId, required this.title});
  Map<String, dynamic> toJson() => {
          'uid': uid,
          'image': image,
          'username': username,
          'title': title,
          'startedAt': startedAt,
          'viewers': viewers,
          'channelId': channelId,
  };
  static LiveStream fromSnap(DocumentSnapshot snap){
    var snapshot=snap.data() as Map<String,dynamic>;
    return LiveStream(
      uid: snapshot['uid'] ?? '', 
      image: snapshot['image'] ?? '', 
      startedAt: snapshot['startedAt'] ?? '', 
      viewers: snapshot['viewers'] ?? '', 
      username: snapshot['username'] ?? '', 
      channelId: snapshot['channelId']?? '',
      title: snapshot['title']?? ''
    );
  }
}