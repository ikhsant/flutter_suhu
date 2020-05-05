import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class Laporan extends StatefulWidget {
  @override
  _LaporanState createState() => _LaporanState();
}

class _LaporanState extends State<Laporan> {
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
              },
              icon: Icon(Icons.send),
              label: Text('Proses'),
              color: Colors.green,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
