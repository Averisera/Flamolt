
import 'dart:ui';

import 'package:flutter/material.dart';

import '../components/searchwidget.dart';
import '../constants.dart';

class StreamPage extends StatelessWidget {
  const StreamPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
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
                    ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        const SizedBox(width: 20,),
                        Image.asset('assets/stream1.png', height: 160, width: 280,),
                        Image.asset('assets/stream2.png', height: 160, width: 280,),
                        Image.asset('assets/stream3.png', height: 160, width: 280,),
                      ],
                ), ),
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
                const SizedBox(height: 15,),
                SizedBox(height: 180, child: 
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
      )
    );
  }
}