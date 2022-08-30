import 'package:dashbelajar/screen/cari.dart';
import 'package:dashbelajar/screen/home.dart';
import 'package:dashbelajar/screen/perencanaan.dart';
import 'package:dashbelajar/screen/profil.dart';
import 'package:dashbelajar/screen/transaksi.dart';
import 'package:dashbelajar/widget/maincolor.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LayoutUtama extends StatefulWidget {
  int index;
  LayoutUtama({this.index});
  @override
  _LayoutUtamaState createState() => _LayoutUtamaState();
}

class _LayoutUtamaState extends State<LayoutUtama> {
  int _selectedNavbar = 0;

  var listpage = <Widget>[
    Home(),
    Transaksi(),
    Cari(),
    Perencanaan(),
    Profil()

  ];
  String role = '';

  @override
  void initState() {
    _loadUserData();
    super.initState();
    if (widget.index != null) {
      setState(() {
        _selectedNavbar = widget.index;
      });
    }
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));
    if (user != null) {
      setState(() {
        role = user['role'];
        if (user['role'] != "user") {
          listpage.removeAt(0);
        }
      });
    }

    // if(user != null) {
    //   if(user['profesi'] == "supir"){
    //     setState(() {
    //       role = user['profesi'];
    //       listpage = <Widget>[
    //           Tracking(),
    //           Pendataan(),
    //           Riwayat(),
    //           Akun(),
    //         ];
    //     });
    //   }else{
    //     setState(() {
    //       role = user['profesi'];
    //       listpage = <Widget>[
    //           Pendataan(),
    //           Riwayat(),
    //           Akun(),
    //         ];
    //     });
    //   }
    // }
  }

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedNavbar,
        children: listpage,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          if (role == "user") ...[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
          ],
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel),
            title: Text('Transaksi'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Cari'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.next_plan_outlined),
            title: Text('Perencanaan'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profil'),
          ),
        ],
        currentIndex: _selectedNavbar,
        selectedItemColor: Maincolor.colormain,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _changeSelectedNavBar,
      ),
    );
  }
}
