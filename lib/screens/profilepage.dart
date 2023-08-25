import 'dart:ui';

import 'package:flutter/material.dart';

import '../components/bottomnavigationbar.dart';
import '../components/buildcontainer.dart';
import '../components/custom_outline.dart';
import '../constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
    bool Pressed1=true;
    bool Pressed2=false;
    bool Pressed3=false;
  void updatePressed1(){
    setState(() {
      Pressed1= true;
      Pressed2=false;
      Pressed3=false;
    });
  }
  void updatePressed2(){
    setState(() {
      Pressed2= true;
      Pressed1=false;
      Pressed3=false;
    });
  }
  void updatePressed3(){
    setState(() {
      Pressed3= true;
      Pressed2=false;
      Pressed1=false;
    });
  }
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
              top: screenHeight*0.5,
              left: 0,
              child: Container(
                height: 50,
                width: screenWidth,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Constants.kYellowColor,),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 80,
                    sigmaY: 80,),
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.transparent,
                    ),),
              )),
              SafeArea(child: Column(
                children: [
                  SizedBox(
                  height: screenHeight*0.1,
                ),
                CustomOutline(strokeWidth: 4, 
              radius: screenWidth*0.4,
              padding: const EdgeInsets.all(4),
              width: screenWidth*0.4, 
              height: screenWidth*0.4,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Constants.kPinkColor,
                  Constants.kPinkColor.withOpacity(0),
                  Constants.kGreenColor.withOpacity(0.1),
                  Constants.kGreenColor,
                ],
                stops: const [0.2, 0.4, 0.6, 1]
              ), 
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    alignment: Alignment.bottomLeft,
                    image: AssetImage('assets/Profilepic.png'),)
                ),
              ),
              ),
              SizedBox(
                height: screenHeight*0.03,
              ),
              Text('AVERISERA',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Constants.kWhiteColor,
                fontSize: screenHeight<=667?26:34,
                fontWeight: FontWeight.w900,
              ),),
              SizedBox(
                height: screenHeight*0.02,
              ),
              Stack(
                children:[
                  Container(
                  height: screenHeight*0.42,
                  decoration: const BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),),
                  buildContainer(press1: Pressed1, press2: Pressed2,press3: Pressed3, fx1: updatePressed1, fx2: updatePressed2, fx3: updatePressed3),
                  
                  
                  ]
                  ),
              
              
              
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
              )
              ],
            )
          )
        ]
    )),
    bottomNavigationBar: BottomNavBar(),
    );
  }
}