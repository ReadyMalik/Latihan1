import 'package:flutter/material.dart';

class dataForm extends StatelessWidget{
  final String nama;
  final String tglLahir;
  final String umur;

  const dataForm({Key? key, required this.nama, required this.tglLahir, required this.umur})
  : super(key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hasil"
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nama: $nama",
            ),
            Text(
              "Tanggal Lahir: $tglLahir",
            ),
            Text(
              "Umur: $umur",
            ),
          ],
        )
      )
    );
  }
}
