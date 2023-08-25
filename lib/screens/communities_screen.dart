
import 'package:flamolt/components/bottomnavigationbar.dart';
import 'package:flamolt/components/searchwidget1.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CommunitiesScreen extends StatelessWidget {
  const CommunitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Constants.kBlackColor,
      extendBody: true,
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Column(
          children: [
            SizedBox(height: screenHeight*0.08,),
            SizedBox(height: 40, width: screenWidth*0.9,
                child: const SearchFieldWidget1(
                padding: EdgeInsets.symmetric(
                horizontal: 14,
              ),
            ),),
            SizedBox(height: screenHeight*0.05,),
            SizedBox(height: screenHeight*0.04, child: const Text('Your communities', style: TextStyle(color: Constants.kWhiteColor, fontSize: 22.5, fontWeight: FontWeight.bold),),),
            SizedBox(height: screenHeight*0.01,),
            SizedBox(width: screenWidth*0.9,
              child: const Divider(color: Constants.kWhiteColor,)),
            // SizedBox(height: screenHeight*0.01,),
            
            SizedBox(height: screenHeight*0.26,
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: (){Navigator.of(context).pushNamed('/community');},
                    child: Center(
                      child: Container(height: screenHeight*0.05, width: screenWidth*0.88,
                        color: const Color.fromARGB(255, 56, 56, 71),
                        child: Row(
                          children: [
                            Image.asset('assets/Valorant-logo.png', height: screenHeight*0.04,),
                            SizedBox(width: screenWidth*0.01,),
                            const Text('Valorant', style: TextStyle(color: Constants.kWhiteColor, fontSize: 19),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight*0.01,),
                  Center(
                    child: Container(height: screenHeight*0.05, width: screenWidth*0.88,
                      color: const Color.fromARGB(255, 56, 56, 71),
                      child: Row(
                        children: [
                          Image.asset('assets/Valorant-logo.png', height: screenHeight*0.04,),
                          SizedBox(width: screenWidth*0.01,),
                          const Text('Valorant', style: TextStyle(color: Constants.kWhiteColor, fontSize: 19),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight*0.01,),
                  Center(
                    child: Container(height: screenHeight*0.05, width: screenWidth*0.88,
                      color: const Color.fromARGB(255, 56, 56, 71),
                      child: Row(
                        children: [
                          Image.asset('assets/Valorant-logo.png', height: screenHeight*0.04,),
                          SizedBox(width: screenWidth*0.01,),
                          const Text('Valorant', style: TextStyle(color: Constants.kWhiteColor, fontSize: 19),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight*0.01,),
                  Center(
                    child: Container(height: screenHeight*0.05, width: screenWidth*0.88,
                      color: const Color.fromARGB(255, 56, 56, 71),
                      child: Row(
                        children: [
                          Image.asset('assets/Valorant-logo.png', height: screenHeight*0.04,),
                          SizedBox(width: screenWidth*0.01,),
                          const Text('Valorant', style: TextStyle(color: Constants.kWhiteColor, fontSize: 19),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight*0.01,),
                  Center(
                    child: Container(height: screenHeight*0.05, width: screenWidth*0.88,
                      color: const Color.fromARGB(255, 56, 56, 71),
                      child: Row(
                        children: [
                          Image.asset('assets/Valorant-logo.png', height: screenHeight*0.04,),
                          SizedBox(width: screenWidth*0.01,),
                          const Text('Valorant', style: TextStyle(color: Constants.kWhiteColor, fontSize: 19),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight*0.01,),
                  Center(
                    child: Container(height: screenHeight*0.05, width: screenWidth*0.88,
                      color: const Color.fromARGB(255, 56, 56, 71),
                      child: Row(
                        children: [
                          Image.asset('assets/Valorant-logo.png', height: screenHeight*0.04,),
                          SizedBox(width: screenWidth*0.01,),
                          const Text('Valorant', style: TextStyle(color: Constants.kWhiteColor, fontSize: 19),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight*0.01,),
                  Center(
                    child: Container(height: screenHeight*0.05, width: screenWidth*0.88,
                      color: const Color.fromARGB(255, 56, 56, 71),
                      child: Row(
                        children: [
                          Image.asset('assets/Valorant-logo.png', height: screenHeight*0.04,),
                          SizedBox(width: screenWidth*0.01,),
                          const Text('Valorant', style: TextStyle(color: Constants.kWhiteColor, fontSize: 19),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight*0.05,),
            SizedBox(height: screenHeight*0.04, child: const Text('Top communities', style: TextStyle(color: Constants.kWhiteColor, fontSize: 22.5, fontWeight: FontWeight.bold),),),
            SizedBox(height: screenHeight*0.01,),
            SizedBox(width: screenWidth*0.9,
              child: const Divider(color: Constants.kWhiteColor,)),
            // SizedBox(height: screenHeight*0.01,),
            SizedBox( height: screenHeight*0.281,
              child: ListView(
                children: [
                  Center(
                    child: Container(height: screenHeight*0.05, width: screenWidth*0.88,
                      color: const Color.fromARGB(255, 56, 56, 71),
                      child: Row(
                        children: [
                          Image.asset('assets/Valorant-logo.png', height: screenHeight*0.04,),
                          SizedBox(width: screenWidth*0.01,),
                          const Text('Valorant', style: TextStyle(color: Constants.kWhiteColor, fontSize: 19),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight*0.01,),
                  Center(
                    child: Container(height: screenHeight*0.05, width: screenWidth*0.88,
                      color: const Color.fromARGB(255, 56, 56, 71),
                      child: Row(
                        children: [
                          Image.asset('assets/Valorant-logo.png', height: screenHeight*0.04,),
                          SizedBox(width: screenWidth*0.01,),
                          const Text('Valorant', style: TextStyle(color: Constants.kWhiteColor, fontSize: 19),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight*0.01,),
                  Center(
                    child: Container(height: screenHeight*0.05, width: screenWidth*0.88,
                      color: const Color.fromARGB(255, 56, 56, 71),
                      child: Row(
                        children: [
                          Image.asset('assets/Valorant-logo.png', height: screenHeight*0.04,),
                          SizedBox(width: screenWidth*0.01,),
                          const Text('Valorant', style: TextStyle(color: Constants.kWhiteColor, fontSize: 19),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight*0.01,),
                  Center(
                    child: Container(height: screenHeight*0.05, width: screenWidth*0.88,
                      color: const Color.fromARGB(255, 56, 56, 71),
                      child: Row(
                        children: [
                          Image.asset('assets/Valorant-logo.png', height: screenHeight*0.04,),
                          SizedBox(width: screenWidth*0.01,),
                          const Text('Valorant', style: TextStyle(color: Constants.kWhiteColor, fontSize: 19),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight*0.01,),
                  Center(
                    child: Container(height: screenHeight*0.05, width: screenWidth*0.88,
                      color: const Color.fromARGB(255, 56, 56, 71),
                      child: Row(
                        children: [
                          Image.asset('assets/Valorant-logo.png', height: screenHeight*0.04,),
                          SizedBox(width: screenWidth*0.01,),
                          const Text('Valorant', style: TextStyle(color: Constants.kWhiteColor, fontSize: 19),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight*0.01,),
                  Center(
                    child: Container(height: screenHeight*0.05, width: screenWidth*0.88,
                      color: const Color.fromARGB(255, 56, 56, 71),
                      child: Row(
                        children: [
                          Image.asset('assets/Valorant-logo.png', height: screenHeight*0.04,),
                          SizedBox(width: screenWidth*0.01,),
                          const Text('Valorant', style: TextStyle(color: Constants.kWhiteColor, fontSize: 19),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight*0.01,),
                  Center(
                    child: Container(height: screenHeight*0.05, width: screenWidth*0.88,
                      color: const Color.fromARGB(255, 56, 56, 71),
                      child: Row(
                        children: [
                          Image.asset('assets/Valorant-logo.png', height: screenHeight*0.04,),
                          SizedBox(width: screenWidth*0.01,),
                          const Text('Valorant', style: TextStyle(color: Constants.kWhiteColor, fontSize: 19),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}