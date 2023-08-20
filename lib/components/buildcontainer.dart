
import 'package:flamolt/games.dart';
import 'package:flutter/material.dart';

class buildContainer extends StatelessWidget {
  bool press1;
  bool press2;
  bool press3;
  Function fx1;
  Function fx2;
  Function fx3;
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
              }, child: Text('Games', style: TextStyle(color: Colors.white),))
              ),
              SizedBox( height: 40,width: screenWidth*0.33, 
              child: TextButton(onPressed: () {
                fx2();
              }, 
              child: Text('Posts', style: TextStyle(color: Colors.white),))),
              SizedBox( height: 40,width: screenWidth*0.33,
              child: TextButton(onPressed: () {
                fx3();
              }, 
                child: Text('About', style: TextStyle(color: Colors.white),))),
              ],
              ),
                      
              if (press1==true)
              Container(height: screenHeight*0.368,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
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
                  SizedBox(height: 10,),
                  SizedBox(height: 22, child: Text('Achievements (1)', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700), textAlign: TextAlign.left,),),
                  SizedBox(height: 10,),
                  SizedBox(height: 42, child: Image.asset('assets/achievement_icon1.png', ),),
                  SizedBox(height: 10,),
                  SizedBox(height: 22, child: Text('Team (4)', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700), textAlign: TextAlign.left,),),
                  SizedBox(height: 3.5,),
                  SizedBox(height: 42,
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
                ],
              ),
              )
              else if (press2==true)
              Container(height: screenHeight*0.368, color: Colors.white,)
              else if (press3==true)
              Container(height: screenHeight*0.368, color: Colors.green,),
          ],
    );
  }
}