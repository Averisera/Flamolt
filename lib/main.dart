
import 'package:flamolt/providers/user_provider.dart';
import 'package:flamolt/screens/TournamentsScreen.dart';
import 'package:flamolt/screens/add_post_or_live.dart';
import 'package:flamolt/screens/communities_screen.dart';
import 'package:flamolt/screens/community_screen.dart';
import 'package:flamolt/screens/profilepage.dart';
import 'package:flamolt/screens/streampage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'components/route_generator.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider(),)
      ],
      child: MaterialApp(
        title: 'Flutter demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: GoogleFonts.openSans().fontFamily,
        ),

        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
