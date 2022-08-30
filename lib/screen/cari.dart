import 'package:dashbelajar/widget/maincolor.dart';
import 'package:flutter/material.dart';

class Cari extends StatefulWidget {
  @override

  _CariState createState() => _CariState();


}
class _CariState extends State<Cari>{

  @override
  void initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Maincolor.colormain,
      body: Center(
          child: Text("CARI")

      ),

    );

  }
}