
import 'dart:ui';

import 'package:flutter/material.dart';

import '../constants.dart';

class TournamentScreen extends StatelessWidget {
  const TournamentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Constants.kBlackColor,
      extendBody: true,
      body: SizedBox(
        child: Stack(
          children: [
            Positioned(
              top: screenHeight*0.1,
              left: -88,
              child: Container(
                height: 166,
                width: 166,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kPinkColor,),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 200,
                    sigmaY: 200,),
                    child: Container(
                      height: 166,
                      width: 166,
                      color: Colors.transparent,
                    ),),
              )),
            Positioned(
              top: screenHeight*0.3,
              right: -100,
              child: Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kGreenColor,),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 200,
                    sigmaY: 200,),
                    child: Container(
                      height: 200,
                      width: 200,
                      color: Colors.transparent,
                    ),),
              )),
            
            SafeArea(
              child: ListView(
              
              children: [
                Center(
                  child: SizedBox(
                    height: screenHeight*0.35,
                    width: screenWidth*0.94,
                    child: Stack(
                      children: [
                        ShaderMask(
                          shaderCallback: (rect) {
                          return const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.black, Colors.transparent],
                          ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                          },
                          blendMode: BlendMode.dstIn,
                          child: Image.asset(
                            'assets/Tournament_img1.jpg',
                            height: screenHeight*0.35,
                            width: screenWidth*0.94,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Positioned(
                          top: screenHeight*0.25,
                          left: 10,
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text('Valorant Sea Invitational', 
                            style: TextStyle(
                              fontSize: 20, 
                              color: Constants.kWhiteColor,
                              ),),
                          ),
                        ),
                        Positioned(
                          top: screenHeight*0.285,
                          right: 10,
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text('Date: 10th October', 
                            style: TextStyle(
                              fontSize: 13, 
                              color: Constants.kWhiteColor,
                              ),),
                          ),
                        ),
                        Positioned(
                          top: screenHeight*0.29,
                          left: 10,
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text('Entry: Free', 
                            style: TextStyle(
                              fontSize: 15, 
                              color: Constants.kWhiteColor,
                              ),),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    height: screenHeight*0.35,
                    width: screenWidth*0.94,
                    child: Stack(
                      children: [
                        ShaderMask(
                          shaderCallback: (rect) {
                          return const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.black, Colors.transparent],
                          ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                          },
                          blendMode: BlendMode.dstIn,
                          child: Image.asset(
                            'assets/Tournament_img1.jpg',
                            height: screenHeight*0.35,
                            width: screenWidth*0.94,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Positioned(
                          top: screenHeight*0.25,
                          left: 10,
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text('Valorant Sea Invitational', 
                            style: TextStyle(
                              fontSize: 20, 
                              color: Constants.kWhiteColor,
                              ),),
                          ),
                        ),
                        Positioned(
                          top: screenHeight*0.285,
                          right: 10,
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text('Date: 10th October', 
                            style: TextStyle(
                              fontSize: 13, 
                              color: Constants.kWhiteColor,
                              ),),
                          ),
                        ),
                        Positioned(
                          top: screenHeight*0.29,
                          left: 10,
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text('Entry: Free', 
                            style: TextStyle(
                              fontSize: 15, 
                              color: Constants.kWhiteColor,
                              ),),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    height: screenHeight*0.35,
                    width: screenWidth*0.94,
                    child: Stack(
                      children: [
                        ShaderMask(
                          shaderCallback: (rect) {
                          return const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.black, Colors.transparent],
                          ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                          },
                          blendMode: BlendMode.dstIn,
                          child: Image.asset(
                            'assets/Tournament_img1.jpg',
                            height: screenHeight*0.35,
                            width: screenWidth*0.94,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Positioned(
                          top: screenHeight*0.25,
                          left: 10,
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text('Valorant Sea Invitational', 
                            style: TextStyle(
                              fontSize: 20, 
                              color: Constants.kWhiteColor,
                              ),),
                          ),
                        ),
                        Positioned(
                          top: screenHeight*0.285,
                          right: 10,
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text('Date: 10th October', 
                            style: TextStyle(
                              fontSize: 13, 
                              color: Constants.kWhiteColor,
                              ),),
                          ),
                        ),
                        Positioned(
                          top: screenHeight*0.29,
                          left: 10,
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text('Entry: Free', 
                            style: TextStyle(
                              fontSize: 15, 
                              color: Constants.kWhiteColor,
                              ),),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Row(mainAxisAlignment: MainAxisAlignment.center,),
              ],
            ),)
          ],
        ),
      ),
    );
  }
}