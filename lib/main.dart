import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:lat1/user_form.dart';

void main() {
  runApp(hitungUmurApp());
}

class hitungUmurApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Aplikasi Penghitung Umur',
      home: UserForm(),
    );
  }
}
