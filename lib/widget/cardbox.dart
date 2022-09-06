import 'package:dashbelajar/screen/add_perencanaan.dart';
import 'package:dashbelajar/widget/maincolor.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Cardbox extends StatelessWidget {
  String waktu_transaksi;
  String transaksi;
  String biaya;
  String id;
  String keperluan;


  Cardbox({this.transaksi,this.waktu_transaksi,this.biaya,this.id,this.keperluan});


  @override
  Widget build(BuildContext context){

    var waktu_transaksis = waktu_transaksi;
//   if(waktu_transaksi= null){
//      var inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
// var inputDate = inputFormat.parse(waktu_transaksi); // <-- dd/MM 24H format
//
// var outputFormat = DateFormat('dd/MM/yyyy HH:mm');
//      waktu_transaksis = outputFormat.format(inputDate);
//   }

    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                // ListTile(
                //   tileColor: Maincolor.PrimaryColor,
                //   title: Text('${tgl_input_penumpang}',style: TextStyle(color: Colors.white)),
                // ),
                Container(
                  height: 40,
                  color: Maincolor.colormain,
                  child: Row(
                  children:[
                    Expanded(
                      flex:50,
                      child: Container(
                        padding: EdgeInsets.only(left: 8),
                        child: Text('Waktu Transaksi',style: TextStyle(color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                        )),
                          ),
                        ),
                    Expanded(
                      flex:50,
                      child: Container(
                        padding: EdgeInsets.only(right: 8),
                        alignment: Alignment.centerRight,
                        child: Text('$waktu_transaksis',style: TextStyle(color: Colors.white,
                        fontSize: 15
                        )),
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  children:[
                    Expanded(
                      flex:50,
                      child: Container(
                        padding: EdgeInsets.only(left: 8),
                        child: Text('Jenis Transaksi',style: TextStyle(color: Maincolor.colormain,
                        fontSize: 15
                        )),
                          ),
                        ),
                    Expanded(
                      flex:50,
                      child: Container(
                        padding: EdgeInsets.only(right: 8),
                        alignment: Alignment.centerRight,
                        child: Text('$transaksi',style: TextStyle(color: Maincolor.colormain,
                        fontSize: 15
                        )),
                          ),
                        ),
                    ],
                  ),
                SizedBox(height: 8),
                Row(
                  children:[
                    Expanded(
                      flex:50,
                      child: Container(
                        padding: EdgeInsets.only(left: 8),
                        child: Text('Keperluan',style: TextStyle(color: Maincolor.colormain,
                            fontSize: 15
                        )),
                      ),
                    ),
                    Expanded(
                      flex:50,
                      child: Container(
                        padding: EdgeInsets.only(right: 8),
                        alignment: Alignment.centerRight,
                        child: Text('$keperluan',style: TextStyle(color: Maincolor.colormain,
                            fontSize: 15
                        )),
                      ),
                    ),
                  ],
                ),
                
                Row(
                  children:[
                    Expanded(
                      flex:50,
                      child: Container(
                        padding: EdgeInsets.only(left: 8),
                        child: Text('Biaya',style: TextStyle(color: Maincolor.colormain,
                        fontSize: 15
                        )),
                          ),
                        ),
                    Expanded(
                      flex:50,
                      child: Container(
                        padding: EdgeInsets.only(right: 8),
                        alignment: Alignment.centerRight,
                        child: Text('$biaya',style: TextStyle(color: Maincolor.colormain,
                        fontSize: 15
                        )),
                          ),
                        ),
                    ],
                  ),

                Row(
                  children:[
                    Expanded(
                      flex:50,
                      child: IconButton(
                        onPressed: () async {

                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AddPerencanaan(biaya: biaya, transaksi: transaksi,id:id,keperluan:keperluan)));

                        },
                        icon: const Icon(Icons.edit),
                      ),
                    ),

                  ],
                ),


                SizedBox(height: 8),

                SizedBox(height: 10)

              ],

            ));
  }
}