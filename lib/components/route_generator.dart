import 'package:flamolt/main.dart';
import 'package:flamolt/screens/TournamentsScreen.dart';
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
      default:
      return MaterialPageRoute(builder: (_) => OnboardingScreen());
    }
  }
}