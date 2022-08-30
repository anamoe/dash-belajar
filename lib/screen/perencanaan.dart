import 'package:dashbelajar/screen/add_perencanaan.dart';
import 'package:dashbelajar/widget/maincolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Perencanaan extends StatefulWidget {
  @override

  _PerencanaanState createState() => _PerencanaanState();


}
class _PerencanaanState extends State<Perencanaan>{

  @override
  void initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Maincolor.colormain,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 28, vertical: 50),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset("assets/icon/logo.png",width: 200,),
              ),
              Align(
                alignment: Alignment.center,

              ),

              // Container(
              //
              //   margin: EdgeInsets.only(top: 20),
              //   child: Padding(
              //     padding: EdgeInsets.all(2),
              //     child: Form(
              //
              //
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //
              //
              //           SizedBox(height: 42),
              //           SizedBox(
              //             width: double.infinity,
              //             height: 40,
              //             child: FlatButton(
              //               child: Padding(
              //                 padding: EdgeInsets.symmetric(
              //                     horizontal: 18, vertical: 5),
              //                 child: Text(
              //                    'Add Perencanaan',
              //                   textDirection: TextDirection.ltr,
              //                   style: TextStyle(
              //                     color: Colors.blue,
              //                     fontSize: 18.0,
              //                     decoration: TextDecoration.none,
              //                     fontWeight: FontWeight.normal,
              //                   ),
              //                 ),
              //               ),
              //               color: Colors.white,
              //               disabledColor: Colors.grey,
              //               shape: new RoundedRectangleBorder(
              //                   borderRadius: new BorderRadius.circular(15)),
              //               onPressed: () {
              //
              //                 Navigator.push(
              //                   context,
              //                   // DetailPage adalah halaman yang dituju
              //                   MaterialPageRoute(
              //                       builder: (context) => AddPerencanaan(
              //
              //                       )
              //                   ),
              //                 );
              //
              //               },
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );

  }
}