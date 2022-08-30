import 'dart:convert';
import 'package:dashbelajar/network/api.dart';
import 'package:dashbelajar/screen/auth/register.dart';
import 'package:dashbelajar/layout/layoututama.dart';
import 'package:dashbelajar/widget/maincolor.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  var email, password;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Maincolor.colormain,
      key: _scaffoldKey,
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

                child: Text(
                  "LOGIN",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,

                  ),
                ),
              ),

              Container(

                margin: EdgeInsets.only(top: 20),
                child: Padding(
                  padding: EdgeInsets.all(2),
                  child: Form(

                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 18),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Email",
                            style: TextStyle(fontSize: 15,color: Colors.white),

                          ),
                        ),
                        TextFormField(
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 1.0, horizontal: 5)),
                            validator: (emailValue) {
                              if (emailValue.isEmpty) {
                                return 'Please enter your email';
                              }
                              email = emailValue;
                              return null;
                            }),
                        SizedBox(height: 12),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Password",
                            style: TextStyle(fontSize: 15,color: Colors.white),
                          ),
                        ),
                        TextFormField(
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.text,
                            obscureText: _secureText,
                            decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 1.0, horizontal: 5),
                              suffixIcon: IconButton(
                                onPressed: showHide,
                                icon: Icon(_secureText
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                            ),
                            validator: (passwordValue) {
                              if (passwordValue.isEmpty) {
                                return 'Please enter your password';
                              }
                              password = passwordValue;
                              return null;
                            }),
                        SizedBox(height: 42),
                        SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: FlatButton(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 5),
                              child: Text(
                                _isLoading ? 'Proccessing..' : 'Login',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18.0,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            color: Colors.white,
                            disabledColor: Colors.grey,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(15)),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                _login();
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 22),
                        SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: FlatButton(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 5),
                              child: Text(
                                 'Register',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18.0,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            color: Colors.white,
                            disabledColor: Colors.grey,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(15)),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context)=>Register()

                                  )
                              );
                            },
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   new MaterialPageRoute(builder: (context) => ButuhBantuan()),
                  // );
                },
                child: Text(
                  "Butuh Bantuan ? ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login() async {
    setState(() {
      _isLoading = true;
    });
    var data = {'email': email, 'password': password};

    var res = await Network().auth(data, '/login');

    var body = json.decode(res.body);
    if (body['pesan'] == "sukses") {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['user']["api-token"]));
      localStorage.setString('user', json.encode(body['user']));

      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          LayoutUtama()), (Route<dynamic> route) => false);
    } else {
      _showMsg(body['pesan']);
    }

    setState(() {
      _isLoading = false;
    });
  }
}