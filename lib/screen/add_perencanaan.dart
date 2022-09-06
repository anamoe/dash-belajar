// import 'package:path/path.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:dashbelajar/layout/layoututama.dart';
import 'package:dashbelajar/network/api.dart';
import 'package:dashbelajar/widget/maincolor.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';


class AddPerencanaan extends StatefulWidget {
  String waktu_transaksi;
  String transaksi;
  String biaya;
  String id;
  String keperluan;


  AddPerencanaan ({this.transaksi,this.waktu_transaksi,this.biaya,this.id,this.keperluan});

  @override
  _AddPerencanaanState createState() => _AddPerencanaanState();
}
class _AddPerencanaanState extends State<AddPerencanaan> {
  bool _isLoading = false;
  var jenisval, biayaval,keperluanval;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  bool _secureText = true;
  File image;
  File imageFile;

  var croppedFile, uint8list;
  String imagetransaksi;


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

  @override
  void initState() {
    if (widget.id != null) {
      //
      // _fileFromImageUrl();
    }
    super.initState();
  }
  // void _fileFromImageUrl() async {
  //   final response = await http.get(Uri.parse(imagetransaksi));
  //   final documentDirectory = await getApplicationDocumentsDirectory();
  //   setState(() {
  //     imageFile = File(join(documentDirectory.path, 'imagecache.png'));
  //     imageFile.writeAsBytesSync(response.bodyBytes);
  //   });
  // }

  void pickImage() async {
    image = await ImagePicker.pickImage(source: ImageSource.gallery);
    croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
    );
    if (croppedFile != null) {
      setState(() {
        imageFile = croppedFile;
      });
    }
  }

  void dialogLoading(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            margin: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("uploading"),
                const CircularProgressIndicator.adaptive()
              ],
            ),
          ),
        );
      },
    );
  }


  @override

  Widget build(BuildContext context) {
    // print(widget.id);

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
                        initialValue: widget.keperluan,
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
                          pickImage();
                        },
                      ),
                    ),
                  ),

                  Visibility(
                    visible: imageFile != null,
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      child: imageFile != null
                          ? Image.file(imageFile)
                          : Container(),
                    ),
                  ),
                ],
              ),
            ),
          ),

        ),
      ),
    );
  }

  void _perencanaan() async {
    print(imageFile);

    setState(() {
      _isLoading = true;
    });

    var data = {'transaksi': jenisval, 'biaya': biayaval,'keperluan':keperluanval,'bukti_transaksi':imageFile};
    String url= '';
    if(widget.id!=null) {

      url = '/transaksi-update/'+widget.id;
    }else{
      url = '/create-transaksi';

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

