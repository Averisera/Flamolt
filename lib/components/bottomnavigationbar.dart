import 'package:flamolt/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}
int navbarindex=0;
class _BottomNavBarState extends State<BottomNavBar> {
  
  void onTap(int index){
    setState(() {
      navbarindex=index;
    });
    switch(index){
    case 0 :
    Navigator.of(context).pushNamed('/stream');
    case 1 :
    Navigator.of(context).pushNamed('/communities');
    case 2:
    
    Navigator.of(context).pushNamed('/addpostOrLive');
    case 3:
    Navigator.of(context).pushNamed('/tournaments');
    case 4:
    Navigator.of(context).pushNamed('/profile');
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return BottomNavigationBar( 
      type: BottomNavigationBarType.fixed,
      currentIndex: navbarindex,
      selectedItemColor: Constants.kCyanColor,
      unselectedItemColor: Constants.kWhiteColor,
      onTap: onTap,
      backgroundColor: Constants.kBlackColor,
       items: [
        
        BottomNavigationBarItem(
          icon: Icon(Icons.home,),
          label: '',

        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.groups),
          label: '',

        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle),
          label: '',

        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.emoji_events),
          label: '',

        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: '',
        ),
       ],
    );
  }
}