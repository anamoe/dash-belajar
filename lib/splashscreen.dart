

import 'dart:async';

import 'package:dashbelajar/layout/layoututama.dart';
import 'package:dashbelajar/screen/auth/login.dart';
import 'package:dashbelajar/screen/auth/register.dart';
import 'package:dashbelajar/widget/maincolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  @override

  _SplashscreenState createState() => _SplashscreenState();


}
class _SplashscreenState extends State<Splashscreen>{
  bool isAuth = false;
  @override
  void initState(){
    super.initState();
    _checkIfLoggedIn();
    startSplashscreen();
  }
  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if(token != null){
      if(mounted){
        setState(() {
          isAuth = true;
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Maincolor.colormain,
      body: Center(
          child: Image.asset("assets/icon/logo.png",width: 300,)

      ),

    );

  }
  startSplashscreen() async{

    var duration = const Duration(seconds: 2);
    return Timer(duration,(){
      if(isAuth) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LayoutUtama()

            )
        );
      }else{
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Login()

            )
        );
      }

    });
  }

}