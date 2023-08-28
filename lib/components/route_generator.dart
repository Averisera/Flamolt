
import 'package:flamolt/screens/TournamentsScreen.dart';
import 'package:flamolt/screens/add_live.dart';
import 'package:flamolt/screens/add_post.dart';
import 'package:flamolt/screens/add_post_or_live.dart';
import 'package:flamolt/screens/communities_screen.dart';
import 'package:flamolt/screens/community_screen.dart';
import 'package:flamolt/screens/login_screen.dart';
import 'package:flamolt/screens/onboardingscreen.dart';
import 'package:flamolt/screens/profilepage.dart';
import 'package:flamolt/screens/registrationscreen.dart';
import 'package:flamolt/screens/streampage.dart';
import 'package:flutter/material.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args= settings.arguments;
    switch(settings.name) {
      case '/':
      return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case '/login':
      return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/register':
      return MaterialPageRoute(builder: (_) => RegisterScreen());
      case '/profile':
      return MaterialPageRoute(builder: (_) => ProfilePage());
      case '/stream':
      return MaterialPageRoute(builder: (_) => StreamPage());
      case '/communities':
      return MaterialPageRoute(builder: (_) => CommunitiesScreen());
      case '/community':
      return MaterialPageRoute(builder: (_) => CommunityScreen());
      case '/tournaments':
      return MaterialPageRoute(builder: (_) => TournamentScreen());
      case '/addpost' :
      return MaterialPageRoute(builder: (_) => AddPostScreen());
      case '/addlive' :
      return MaterialPageRoute(builder: (_) => AddLiveScreen());
      case '/addpostOrLive' :
      return MaterialPageRoute(builder: (_) => AddPostOrLiveScreen());
      default:
      return MaterialPageRoute(builder: (_) => OnboardingScreen());
    }
  }
}