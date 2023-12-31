
import 'dart:ui';
import 'package:flamolt/resources/auth_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/custom_outline.dart';
import '../constants.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController= TextEditingController();
  final TextEditingController _usernameController= TextEditingController();
  final TextEditingController _passwordController= TextEditingController();
  @override
  void dispose(){
    super.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            
            SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                SizedBox(height: screenHeight*0.3,
                child: Image.asset('assets/flamolt_logo1.png'),),
                SizedBox(height: screenHeight*0.01,),
                SizedBox(height: screenHeight*0.3, width: screenWidth*0.8, 
                child: Column(
                  children: [
                    TextField(
                      controller: _usernameController,
                      style: const TextStyle(color: Constants.kWhiteColor),
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(color: Constants.kWhiteColor),
                        suffixIcon: Icon(CupertinoIcons.person, color: Constants.kWhiteColor,),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Constants.kWhiteColor))
                        ),),
                    TextField(
                      controller: _emailController,
                      style: const TextStyle(color: Constants.kWhiteColor),
                      decoration: const InputDecoration(
                        labelText: 'Email Address',
                        labelStyle: TextStyle(color: Constants.kWhiteColor),
                        suffixIcon: Icon(CupertinoIcons.envelope, color: Constants.kWhiteColor,),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Constants.kWhiteColor))
                        ),),
                    TextField(
                      controller: _passwordController,
                      style: const TextStyle(color: Constants.kWhiteColor),
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Constants.kWhiteColor),
                        suffixIcon: Icon(CupertinoIcons.eye_slash, color: Constants.kWhiteColor,),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Constants.kWhiteColor))
                        ),),
                  ],
                ),),
                SizedBox(height: screenHeight*0.04,),
              GestureDetector(
                onTap: (() async {
                  String res1= await AuthMethods().signUpUser(username: _usernameController.text, email: _emailController.text, password: _passwordController.text);
                  if(res1=='success'){
                    Navigator.of(context).pushNamed('/login');
                  }
                } ),
                child: CustomOutline(strokeWidth: 3, 
                radius: 20,
                padding: const EdgeInsets.all(3),
                width: 180, 
                height: 50,
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
                    borderRadius: BorderRadius.circular(10),
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
                  child: Text('Register',
                  style: TextStyle(
                    fontSize: 20,
                    color: Constants.kWhiteColor,
                  ),),
                ),
                ),
                ),
              ),
              SizedBox(height: screenHeight*0.24,),
                const Row(mainAxisAlignment: MainAxisAlignment.center,)
              ],
            ),),
            
          ]))
    );
  }
}