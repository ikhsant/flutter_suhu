import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:http/http.dart' as http;

class Laporan extends StatefulWidget {
  @override
  _LaporanState createState() => _LaporanState();
}

Future<Suhu> getLaporan(String mulai,String selesai) async {
  final http.Response response = await http.post(
    'http://ikhsanthohir.id/suhu/suhu_laporan.php',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'mulai': mulai,
      'selesai': selesai,
    }),
  );

  if (response.statusCode == 200) {
    return Suhu.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed.');
  }


  // print(json.decode(response.body));
}

class Suhu {
  String tanggal;
  int suhu;

  Suhu({this.tanggal,this.suhu});

  factory Suhu.fromJson(Map<String,dynamic> json){
    return Suhu(
      tanggal: json['tanggal'],
      suhu: json['suhu']
    );
  }
}

class _LaporanState extends State<Laporan> {
  final TextEditingController _selesaiController = TextEditingController();
  final TextEditingController _mulaiController = TextEditingController();
  Future<Suhu> _futureSuhu;
  final format = DateFormat("yyyy-MM-dd");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laporan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 50.0),
            Text(
              'Pilih Range Tanggal',
              style: TextStyle(
                fontSize: 20.0,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 20.0),
            DateTimeField(
              controller: _mulaiController,
              format: format,
              onShowPicker: (context, currentValue) {
                return showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100));
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Sampai dengan',
              style: TextStyle(
                fontSize: 14.0,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 10.0),
            DateTimeField(
              controller: _selesaiController,
              format: format,
              onShowPicker: (context, currentValue) {
                return showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100));
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.0),
            RaisedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/laporan_table');
                // print(_mulaiController.text);
                // print(_selesaiController.text);
                // _futureSuhu = getLaporan(_mulaiController.text,_selesaiController.text);
              },
              icon: Icon(Icons.send),
              label: Text('Proses'),
              color: Colors.green,
              textColor: Colors.white,
            ),
            (_futureSuhu == null)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Text('kosong'),
                  ],
                )
              : FutureBuilder<Suhu>(
                  future: _futureSuhu,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data.tanggal);
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    return CircularProgressIndicator();
                  },
                ),
          ],
        ),
      ),
    );
  }
}

