import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flamolt/components/firestore_methods.dart';
import 'package:flamolt/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class Chat extends StatefulWidget {
  final String channelId;
  const Chat({super.key, required this.channelId});
  
  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final TextEditingController _chatController= TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _chatController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final userProvider= Provider.of<UserProvider>(context);
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: StreamBuilder<dynamic>(
              stream: FirebaseFirestore.instance.collection('livestream').doc(widget.channelId).collection('comments').orderBy('createdAt', descending: true).snapshots(), 
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const CircularProgressIndicator();
                }
                return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      title: Text(snapshot.data.docs[index]['username'],
                      style: TextStyle(
                        color: snapshot.data.docs[index]['uid'] == userProvider.getUser.uid ? Colors.blue: Colors.white,
                      ),
                    ),
                    subtitle: Text(snapshot.data.docs[index]['message']),
                    );
                  },
                );
          },)),
          TextField(
            onSubmitted: (value) {
              FirestoreMethods().chat(_chatController.text, widget.channelId, context);
              setState(() {
                _chatController.text='';
              });
            },
            style: TextStyle(color: Constants.kWhiteColor, fontSize: 20),
            controller: _chatController,
            decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Constants.kWhiteColor,
                  width: 2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Constants.kGreyColor,
                )
              )
            ),
          ),
        ],
      ),
    );
  }
}