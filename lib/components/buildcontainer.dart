
import 'package:flamolt/components/bottomnavigationbar.dart';
import 'package:flutter/material.dart';

class buildContainer extends StatelessWidget {
  final bool press1;
  final bool press2;
  final bool press3;
  final Function fx1;
  final Function fx2;
  final Function fx3;
  buildContainer({super.key, required this.fx1, required this.fx2, required this.fx3, required this.press1, required this.press2, required this.press3});

  
  @override
  Widget build(BuildContext context) {
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;
    return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: screenWidth*0.33, height: 40, 
              child: TextButton(onPressed: () {
                fx1();
              }, child: const Text('Games', style: TextStyle(color: Colors.white),))
              ),
              SizedBox( height: 40,width: screenWidth*0.33, 
              child: TextButton(onPressed: () {
                fx2();
              }, 
              child: const Text('Posts', style: TextStyle(color: Colors.white),))),
              SizedBox( height: 40,width: screenWidth*0.33,
              child: TextButton(onPressed: () {
                fx3();
              }, 
                child: const Text('About', style: TextStyle(color: Colors.white),))),
              ],
              ),
                      
              if (press1==true)
              SizedBox(height: screenHeight*0.35,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10,),
                  SizedBox(height: 80,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        Image.asset('assets/pubg.jfif', width: 120, height: 80, ),
                        Image.asset('assets/call_duty.jfif', width: 120, height: 80, ),
                        Image.asset('assets/fortnite.jfif', width: 120, height: 80,),
                        Image.asset('assets/dota2.jfif', width: 120, height: 80,),
                      ],
                    ),
                  ),
                  const SizedBox(height: 3.5,),
                  const SizedBox(height: 22, child: Text('Achievements (1)', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700), textAlign: TextAlign.left,),),
                  const SizedBox(height: 4,),
                  SizedBox(height: 42, child: Image.asset('assets/achievement_icon1.png', ),),
                  const SizedBox(height: 4,),
                  const SizedBox(height: 22, child: Text('Team (4)', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700), textAlign: TextAlign.left,),),
                  const SizedBox(height: 3.5,),
                  SizedBox(height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        Image.asset('assets/team_img1.jfif', width: 70, height: 42, ),
                        Image.asset('assets/team_img2.jfif', width: 70, height: 42, ),
                        Image.asset('assets/team_img3.jpg', width: 70, height: 42,),
                        Image.asset('assets/team_img4.jfif', width: 70, height: 42,),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8,),
                  // BottomNavBar(),
                ],
              ),
              )
              else if (press2==true)
              Container(height: screenHeight*0.35, color: Colors.white,)
              else if (press3==true)
              Container(height: screenHeight*0.35, color: Colors.green,),
          ],
    );
  }
}