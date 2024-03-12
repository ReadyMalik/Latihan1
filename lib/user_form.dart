import'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lat1/data_user.dart';

class UserForm  extends StatefulWidget{
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {

  DateTime selectedDate = DateTime.now();

  // Mendefinisikan fungsi untuk memilih tanggal menggunakan date picker
  void _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1945), // Mengatur tanggal minimum menjadi tahun 1945
      lastDate: DateTime.now(), // Mengatur tanggal maksimum menjadi tanggal saat ini
    );

    if (selected != null && selected != selectedDate) { // Memastikan user memilih tanggal && memilih tanggal yang berbeda dari sebelumnya
      setState(() {
        selectedDate = selected; // Memperbarui variabel selectedDate
        _dateController.text = DateFormat('dd/MM/yyyy').format(selectedDate); // Mengupdate teks pada tanggal lahir dengan tanggal yang baru dipilih.
      });
    }
  }

  TextEditingController _inputController = TextEditingController();
  TextEditingController _dateController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("FORM")
      ),
      body: Column(
        children: [
          _textboxNamaUser(),
          _textboxTgllahirUser(),
          _tombolHitung()
        ],
      ),
    );
  }


  Widget _buildWidgetWithMargin() {
    return Container(
      margin: EdgeInsets.all(16.0), // Tambahkan margin sebesar 16 piksel di semua sisi
      child: _textboxNamaUser(), // Ganti YourWidget dengan widget yang ingin Anda tambahkan margin-nya
    );
  }
  _textboxNamaUser() {
    return TextField(
      controller: _inputController,
      decoration: InputDecoration(labelText: "Masukkan Nama"),
    );
  }

  _textboxTgllahirUser() {
    return TextField(
            controller: _dateController,
            decoration: InputDecoration(
              labelText: 'DATE',
        suffixIcon: IconButton(
        icon: Icon(Icons.calendar_today),
        onPressed: () {
          _selectDate(context);
        },
    ),
            ),
        readOnly: true,

        );
  }

  _tombolHitung() {
    return ElevatedButton(
      child: Text('Hitung'),
      onPressed: () {
        String nama = _inputController.text;
        String tglLahir = _dateController.text;
        String umur = penghitungUmur(tglLahir);

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context)=> dataForm(nama: nama, tglLahir: tglLahir, umur: umur),
          ),
        );

      },
    );
  }

  String penghitungUmur(String dob){
    DateTime birthdate = DateFormat('dd/MM/yyyy').parse(dob);
    DateTime hariIni = DateTime.now();
    Duration umur = hariIni.difference(birthdate);

    int years = umur.inDays ~/ 365;
    int months = (umur.inDays % 365) ~/ 30;
    int days = (umur.inDays % 365) % 30;

    return'$years tahun, $months bulan, $days hari';

  }
}