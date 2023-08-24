
import 'package:flamolt/screens/TournamentsScreen.dart';
import 'package:flamolt/screens/communities_screen.dart';
import 'package:flamolt/screens/community_screen.dart';
import 'package:flamolt/screens/login_screen.dart';
import 'package:flamolt/screens/onboardingscreen.dart';
import 'package:flamolt/screens/profilepage.dart';
import 'package:flamolt/screens/registrationscreen.dart';
import 'package:flamolt/screens/streampage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.openSans().fontFamily,
      ),
      home: const CommunityScreen(),
    );
  }
}
