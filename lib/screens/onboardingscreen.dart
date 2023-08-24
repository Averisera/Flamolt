
import 'dart:ui';

import 'package:flamolt/constants.dart';
import 'package:flamolt/components/custom_outline.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constants.kBlackColor,
      extendBody: true,
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
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
            SafeArea(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenHeight*0.07,
                ),
              CustomOutline(strokeWidth: 4, 
              radius: screenWidth*0.8,
              padding: const EdgeInsets.all(4),
              width: screenWidth*0.8, 
              height: screenWidth*0.8,
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
                    image: AssetImage('assets/flamolt_logo.png'),)
                ),
              ),
              ),
              SizedBox(
                height: screenHeight*0.09,
              ),
              Text('Revolutionising \n Gaming',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Constants.kWhiteColor.withOpacity(0.85),
                fontSize: screenHeight<=667?18:30,
                fontWeight: FontWeight.w700,
              ),),
              const Spacer(),
              SizedBox(
                height: screenHeight*0.03,
              ),
              CustomOutline(strokeWidth: 3, 
              radius: 20,
              padding: const EdgeInsets.all(3),
              width: 160, 
              height: 38,
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Constants.kPinkColor,
                  Constants.kGreenColor,
                ],
              ), 
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Constants.kPinkColor.withOpacity(0.5),
                  Constants.kGreenColor.withOpacity(0.5),
                ],
              ),
              ),
              child: const Center(
                child: Text('Sign Up',
                style: TextStyle(
                  fontSize: 14,
                  color: Constants.kWhiteColor,
                ),),
              ),
              ),
              ),
              CustomOutline(strokeWidth: 3, 
              radius: 20,
              padding: const EdgeInsets.all(3),
              width: 160, 
              height: 38,
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Constants.kPinkColor,
                  Constants.kGreenColor,
                ],
              ), 
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Constants.kPinkColor.withOpacity(0.5),
                  Constants.kGreenColor.withOpacity(0.5),
                ],
              ),
              ),
              child: const Center(
                child: Text('Log In',
                style: TextStyle(
                  fontSize: 14,
                  color: Constants.kWhiteColor,
                ),),
              ),
              ),
              ),
              const Spacer(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
              )
              ],
            ),),
          ],
        ),
      ),
    );
  }
}