import 'dart:convert';

import 'package:dashbelajar/screen/auth/login.dart';
import 'package:dashbelajar/widget/maincolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profil extends StatefulWidget {
  @override
  _AkunState createState() => _AkunState();
}

class _AkunState extends State<Profil> {
  String nama = '';
  String alamat = '';
  String noTelp = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));

    if (user != null) {
      setState(() {
        nama = user['nama_lengkap'];
        alamat = user['no_hp_ortu'];
        noTelp = user['no_hp'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Maincolor.colormain,
      appBar: AppBar(
        title: Center(
          child: Text(
            "Profil",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Maincolor.colormain,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.symmetric(vertical: 25),
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset("assets/icon/logo.png", width: 90),
                )),
            Text(
              "${nama}",
              style: TextStyle(fontSize: 32,color: Colors.white),
            ),

            SizedBox(height: 10),
            Text(
              "No. HP",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            Text(
              "${alamat}",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              "No. HP orangtua",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            Text(
              "${noTelp}",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),

            SizedBox(height: 15),


            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: FlatButton(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                    child: Text(
                      ' Ubah Data Akun',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  color: Maincolor.colormain,
                  disabledColor: Colors.white,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15)),
                  // onPressed: () {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => UbahData()),
                  //   );
                  // },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: FlatButton(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                    child: Text(
                      ' Ubah Password',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  color: Maincolor.colormain,
                  disabledColor: Colors.white,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15)),
                  // onPressed: () {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => UbahPassword()),
                  //   );
                  // },
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: FlatButton(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                    child: Text(
                      'Tentang Aplikasi',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  color: Maincolor.colormain,
                  disabledColor: Colors.white,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15)),
                  // onPressed: () {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => Tentang()),
                  //   );
                  // },
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: FlatButton(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                    child: Text(
                      'Keluar',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  color: Colors.red,
                  disabledColor: Colors.grey,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15)),
                  onPressed: () {
                    confirm_logout();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void confirm_logout(){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      child: Text(
                        "Apakah Anda Akan Keluar?",
                        style: TextStyle(
                            color: Maincolor.colormain,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: FlatButton(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 18, vertical: 5),
                            child: Text(
                              'Keluar',
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          color: Colors.red,
                          disabledColor: Colors.grey,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(15)),
                          onPressed: () {
                            Navigator.of(context).pop();
                            logout();
                          }),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: FlatButton(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 18, vertical: 5),
                            child: Text(
                              'Batal',
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          color: Colors.grey,
                          disabledColor: Colors.grey,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(15)),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                    ),


                  ],
                ),
              ),
            ),
          );
        });
  }

  void logout() async {
    // var res = await Network().getData('/logout');
    // var body = json.decode(res.body);
    // if(body['success']){
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('user');
    localStorage.remove('token');
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login()));

    // }
  }
}