import 'dart:convert';

import 'package:dashbelajar/network/api.dart';
import 'package:dashbelajar/screen/add_perencanaan.dart';
import 'package:dashbelajar/widget/cardbox.dart';
import 'package:dashbelajar/widget/maincolor.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Transaksi extends StatefulWidget {
@override
_TransaksiState createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  var data;
  var id;
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
        id = user['id'];
        getRiwayat();
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Riwayat Transaksi",
            style: TextStyle(color: Colors.black,),
          ),
        ),
        backgroundColor: Maincolor.colormain,
        automaticallyImplyLeading: false,


        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                  AddPerencanaan()), (Route<dynamic> route) => false);

            },
            icon: const Icon(Icons.add_circle),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: getRiwayat,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 25, left: 15, right: 15),
          child: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, i) {
                // print(data[i]);
                return Cardbox(
                  transaksi: data[i]["transaksi"],
                  waktu_transaksi: data[i]["created_at"],
                  biaya: data[i]['biaya'],

                );
              }),

        ),





      ),
    );
  }

  Future getRiwayat() async {

    var res = await Network().getData("/transaksi/$id");
    var body = json.decode(res.body);

    setState(() {
      data = body["data"];


    });
  }
}