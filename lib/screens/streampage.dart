
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flamolt/components/bottomnavigationbar.dart';
import 'package:flamolt/components/livestream.dart';
import 'package:flamolt/screens/add_live.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/searchwidget.dart';
import '../constants.dart';
import '../providers/user_provider.dart';

class StreamPage extends StatefulWidget {
  const StreamPage({super.key});

  @override
  State<StreamPage> createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  addData() async {
    UserProvider _userProvider = Provider.of(context, listen: false);
    await _userProvider.refreshUser();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addData();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Colors.black,
      extendBody: true,
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          children: [
            Positioned(
              top: screenHeight*0.2,
              left: -3.98,
              child: Container(
                height: screenHeight*0.8,
                width: screenWidth*0.01,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Constants.kYellowColor),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 70,
                    sigmaY: 70,),
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.transparent,
                    ),),
              )),
            SafeArea(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16,),
                const Row(
                  children: [
                    SizedBox(width: 20,),
                    SizedBox(height: 35, child: Text('Watch Live', style: TextStyle(fontSize: 24, color: Colors.white,fontWeight: FontWeight.bold),),),
                  ],
                ),
                const SizedBox(height: 10,),
                SizedBox(height: 40, width: screenWidth*0.9,
                  child: const SearchFieldWidget(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                    ),
                ),
                const SizedBox(height: 19,),
                SizedBox(height: 160, child: 
                StreamBuilder<dynamic>(
                  stream: FirebaseFirestore.instance.collection('livestream').snapshots(), 
                  builder: (context, snapshot) {
                    if (snapshot.connectionState==ConnectionState.waiting){
                      return CircularProgressIndicator();
                    }
                    return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      LiveStream post= LiveStream.fromSnap(snapshot.data.docs[index]);
                      return InkWell(
                        onTap: () async {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddLiveScreen(isBroadcasting: false, channelId: post.channelId)));
                        },
                        child: Container(child: Image.network(post.image),),
                      );
                    },
                  );
                  }
                ) 
                ),
                const SizedBox(height: 20,),
                SizedBox(height: 75, 
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    const SizedBox(width: 15,),
                    Column(children: [
                      Image.asset('assets/Valorant-logo.png', height: 60, width: 75,),
                      const SizedBox(height: 15, child: Text('Valorant', style: TextStyle(color: Colors.white),),)
                    ],),
                    const SizedBox(width: 5,),
                    Column(children: [
                      Image.asset('assets/Dota2-logo.png', height: 60, width: 75,),
                      const SizedBox(height: 15, child: Text('Dota2', style: TextStyle(color: Colors.white),),)
                    ],),
                    const SizedBox(width: 5,),
                    Column(children: [
                      Image.asset('assets/Pubg-logo.jfif', height: 60, width: 75,),
                      const SizedBox(height: 15, child: Text('PubG', style: TextStyle(color: Colors.white),),)
                    ],),
                    const SizedBox(width: 5,),
                    Column(children: [
                      Image.asset('assets/Fortnite-logo.jfif', height: 60, width: 75,),
                      const SizedBox(height: 15, child: Text('Fortnite', style: TextStyle(color: Colors.white),),)
                    ],),
                    const SizedBox(width: 5,),
                    Column(children: [
                      Image.asset('assets/Overwatch-logo.jfif', height: 60, width: 75,),
                      const SizedBox(height: 15, child: Text('Overwatch', style: TextStyle(color: Colors.white),),)
                    ],),
                  ],
                ),
                ),
                const SizedBox(height: 20,),
                const Row(
                  children: [
                    SizedBox(width: 20,),
                    SizedBox(height: 35, child: Text('Top Streamers Live', style: TextStyle(fontSize: 24, color: Colors.white,fontWeight: FontWeight.bold),),),
                  ],
                ),
                const SizedBox(height: 8.2,),
                SizedBox(height: screenHeight*0.24, child: 
                    ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        const SizedBox(width: 20,),
                        Image.asset('assets/topstream1.png', height: 180, width: 260,),
                        Image.asset('assets/topstream2.png', height: 180, width: 260,),
                        Image.asset('assets/topstream3.png', height: 180, width: 260,),
                        Image.asset('assets/topstream4.png', height: 180, width: 260,),
                      ],
                ), ),
                
              ],
            )
          )
          ]
        )
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}