import 'package:dashbelajar/widget/maincolor.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override

  _HomeState createState() => _HomeState();


}
class _HomeState extends State<Home>{

  @override
  void initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Maincolor.colormain,
      body: Center(
          child: Text("HOME")

      ),

    );

  }
}