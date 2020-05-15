import 'package:flutter/material.dart';

class LaporanTable extends StatefulWidget {
  @override
  _LaporanTableState createState() => _LaporanTableState();
}

class _LaporanTableState extends State<LaporanTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laporan Detail'),
      ),
      body: ListView(children: <Widget>[
        SizedBox(height: 10.0),
        Center(
            child: Text(
          'Laporan Detail',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        DataTable(
          columns: [
            DataColumn(label: Text('Tanggal')),
            DataColumn(label: Text('Suhu')),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('2020-04-31 13:00')),
              DataCell(Text('28')),
            ]),
            DataRow(cells: [
              DataCell(Text('2020-04-31 13:05')),
              DataCell(Text('25')),
            ]),
            DataRow(cells: [
              DataCell(Text('2020-04-31 13:10')),
              DataCell(Text('26')),
            ]),
            DataRow(cells: [
              DataCell(Text('2020-04-31 13:15')),
              DataCell(Text('26')),
            ]),
            DataRow(cells: [
              DataCell(Text('2020-04-31 13:20')),
              DataCell(Text('26')),
            ]),
            DataRow(cells: [
              DataCell(Text('2020-04-31 13:25')),
              DataCell(Text('30')),
            ]),
            DataRow(cells: [
              DataCell(Text('2020-04-31 13:30')),
              DataCell(Text('26')),
            ]),
            DataRow(cells: [
              DataCell(Text('2020-04-31 13:35')),
              DataCell(Text('26')),
            ]),
            DataRow(cells: [
              DataCell(Text('2020-04-31 13:40')),
              DataCell(Text('27')),
            ]),
            DataRow(cells: [
              DataCell(Text('2020-04-31 13:45')),
              DataCell(Text('26')),
            ]),
            DataRow(cells: [
              DataCell(Text('2020-04-31 13:50')),
              DataCell(Text('26')),
            ]),
          ],
        ),
      ]),
    );
  }
}
