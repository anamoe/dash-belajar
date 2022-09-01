import 'dart:async';
import 'dart:convert';

import 'package:dashbelajar/layout/layoututama.dart';
import 'package:dashbelajar/network/api.dart';
import 'package:dashbelajar/widget/maincolor.dart';
import 'package:flutter/material.dart';

class AddPerencanaan extends StatefulWidget {
  String waktu_transaksi;
  String transaksi;
  String biaya;
  String id;


  AddPerencanaan ({this.transaksi,this.waktu_transaksi,this.biaya,this.id});

  @override
  _AddPerencanaanState createState() => _AddPerencanaanState();
}
class _AddPerencanaanState extends State<AddPerencanaan> {
  bool _isLoading = false;
  var jenisval, biayaval,keperluanval;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  bool _secureText = true;


  // TextEditingController jenistransaksi = TextEditingController();
  // TextEditingController keperluan = TextEditingController();
  // TextEditingController biaya = TextEditingController();

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
    print(widget.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.id==null?"Unggah Perencanaan Anda":"Edit Perencanaan Anda",
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Maincolor.colormain,
        leading: IconButton(
          onPressed: () {

              Navigator.of(context).pop();


          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              if (_formKey.currentState.validate()) {

                  _perencanaan();

              }

            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: () {
          Navigator.pop(context, true);
          return Future.value(true);
        },
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 1.1,
            padding: const EdgeInsets.only(top: 5),
            color: Maincolor.colormain,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: TextFormField(
                      maxLines: 1,
                      // controller: jenistransaksi,
                      cursorColor: Colors.white,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                        initialValue: widget.transaksi,
                        validator: (trans) {
                          if (trans.isEmpty) {
                            return 'Masukkan Jenis Transaksi';
                          }
                          jenisval = trans;
                          return null;
                        },
                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        prefixIcon: const Icon(
                          Icons.title,
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        fillColor: Colors.white,
                        hintText: "Jenis Transaksi",
                        hintStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        labelText: "Jenis Transaksi",
                        labelStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: "ComicSans",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: TextFormField(
                      minLines: 5,
                      maxLines: 10,
                      // controller: keperluan,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                        initialValue: '-',
                        validator: (keperluan) {
                          if (keperluan.isEmpty) {
                            return 'Masukkan Keperluan';
                          }
                          keperluanval = keperluan;
                          return null;
                        },
                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        prefixIcon: const Icon(
                          Icons.line_style_outlined,
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        fillColor: Colors.white,
                        hintText: "Keperluan",
                        hintStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        labelText: 'Keperluan',
                        labelStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: "ComicSans",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: TextFormField(
                      maxLines: 1,
                      // controller: biaya,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                      initialValue: widget.biaya,
                      validator: (biaya) {
                        if (biaya.isEmpty) {
                          return 'Masukkan Biaya';
                        }
                        biayaval = biaya;
                        return null;
                      },
                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        prefixIcon: const Icon(
                          Icons.money,
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        fillColor: Colors.white,
                        hintText: "Biaya",
                        hintStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        labelText: 'Biaya',
                        labelStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: "ComicSans",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.all(15),
                    child: SizedBox(
                      height: 64,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.white,
                          ),
                          elevation: MaterialStateProperty.all(6),
                          shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        child: Text(
                          _isLoading ? 'Proccessing..' : 'Ambil Bukti Transaksi',
                          style: const TextStyle(
                            fontFamily: 'ComicSans',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {
                          // pickImage();
                        },
                      ),
                    ),
                  ),

                  // Visibility(
                  //   visible: imageFile != null,
                  //   child: Container(
                  //     margin: const EdgeInsets.all(15),
                  //     child: imageFile != null
                  //         ? Image.file(imageFile!)
                  //         : Container(),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),

        ),
      ),
    );
  }

  void _perencanaan() async {

    setState(() {
      _isLoading = true;
    });

    var data = {'transaksi': jenisval, 'biaya': biayaval,'keperluan':keperluanval};
    String url= '';
    if(widget.id!=null) {
      url = '/create-transaksi';
    }else{
      url = '/transaksi-update/'+widget.id;
    }

    var res = await Network().auth(data, url);

    var body = json.decode(res.body);
    if (body['pesan'] == "sukses") {
      int idx = 1;
      Timer(Duration(milliseconds: 200), () {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
            LayoutUtama(index: idx)), (Route<dynamic> route) => false);
      });
    } else {
      _showMsg(body['pesan']);
    }

    setState(() {
      _isLoading = false;
    });
  }

}

