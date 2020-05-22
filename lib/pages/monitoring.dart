import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart' as charts;

class Monitoring extends StatefulWidget {
  @override
  _MonitoringPageState createState() => new _MonitoringPageState();
}

class _MonitoringPageState extends State<Monitoring> {
  List data;
  Timer timer;

  makeRequest() async {
    var response = await http.get(
      'http://ikhsanthohir.id/suhu/kadarair_chart.php',
      headers: {'Accept': 'application/json'},
    );

    setState(() {
      data = json.decode(response.body);
    });
  }

  @override
  void initState() {
    super.initState();
    // makeRequest();
    timer = new Timer.periodic(new Duration(seconds: 2), (t) => makeRequest());
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Monitoring'),
      ),
      body: data == null ? CircularProgressIndicator() : createChart(),
    );
  }

  charts.Series<LiveWerkzeuge, String> createSeries(
      String id, int i, String tanggal) {
    return charts.Series<LiveWerkzeuge, String>(
      id: id,
      domainFn: (LiveWerkzeuge wear, _) => wear.wsp,
      measureFn: (LiveWerkzeuge wear, _) => wear.belastung,
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      data: [
        LiveWerkzeuge(tanggal, data[i]['kadarair']),
      ],
    );
  }

  Widget createChart() {

    List<charts.Series<LiveWerkzeuge, String>> seriesList = [];

    for (int i = 0; i < data.length; i++) {
      String id = 'WZG${i + 1}';

      // get tanggal
      // DateTime tanggal_terakhir = DateTime.parse(data[i]['tanggal']);
      // String tanggal = DateFormat('s').format(tanggal_terakhir);
      String tanggal = 'Monitor Kadar Air tanaman dalam Persen';

      seriesList.add(createSeries(id, i, tanggal));
    }

    // print(data);

    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0,50.0,0.0,20.0),
      child: new charts.BarChart(
        seriesList,
        // barGroupingType: charts.BarGroupingType.grouped,
      ),
    );
  }
}

class LiveWerkzeuge {
  final String wsp;
  final int belastung;

  LiveWerkzeuge(this.wsp, this.belastung);
}
