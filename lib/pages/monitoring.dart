import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Monitoring extends StatefulWidget {
  @override
  _MonitoringState createState() => _MonitoringState();
}

class _MonitoringState extends State<Monitoring> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monitoring'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 100.0, 10.0, 100.0),
        child: PointsLineChart(
          _createSampleData(),
          // Disable animations for image tests.
          animate: true,
        ),
      ),
    );
  }
}

class PointsLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  PointsLineChart(this.seriesList, {this.animate});
  
  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
    );
  }
}

/// Create one series with sample hard coded data.
List<charts.Series<DataSuhu, String>> _createSampleData() {
  final data = [
    new DataSuhu('13:05', 34),
    new DataSuhu('13:06', 36),
    new DataSuhu('13:07', 34),
    new DataSuhu('13:08', 37),
    new DataSuhu('13:09', 34),
    new DataSuhu('13:10', 37),
    new DataSuhu('13:11', 34),
    new DataSuhu('13:12', 36),
    new DataSuhu('13:13', 34),
    new DataSuhu('13:14', 36),
  ];

  return [
    new charts.Series<DataSuhu, String>(
      id: 'Suhu',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (DataSuhu suhu, _) => suhu.tanggal,
      measureFn: (DataSuhu suhu, _) => suhu.suhu,
      data: data,
    )
  ];
}

/// Sample Data.
class DataSuhu {
  final String tanggal;
  final int suhu;

  DataSuhu(this.tanggal, this.suhu);
}
