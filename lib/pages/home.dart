import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String suhusekarang = '';

  // timer
  void _timer() {
    Future.delayed(Duration(seconds: 3)).then((_) {
      setState(() {
        getSuhu();
      });
      _timer();
    });
  }

  // get suhu
  void getSuhu() async {
    Response response =
        await get('http://ikhsanthohir.id/suhu/suhu_sekrang.php');
    Map suhu = jsonDecode(response.body);
    // print(suhu);
    setState(() {
      suhusekarang = suhu['suhu'];
    });
  }

  @override
  void initState() {
    super.initState();
    getSuhu();
    _timer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(),
            SizedBox(height: 50.0),
             Image(
                  image: AssetImage('assets/suhu.png'),
                  height: 50.0,
                ),
            SizedBox(height: 10.0),
            Text(
              'Suhu saat ini',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            Text(
              '$suhusekarang',
              style: TextStyle(
                fontSize: 120.0,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 50.0),
            RaisedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/monitoring');
              },
              label: Text('Monitor'),
              icon: Icon(Icons.insert_chart),
              color: Colors.green,
              textColor: Colors.white,
            ),
            SizedBox(
              width: 20.0,
            ),
            RaisedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/laporan');
              },
              color: Colors.blue,
              textColor: Colors.white,
              label: Text('Laporan'),
              icon: Icon(Icons.print),
            ),
            SizedBox(
              width: 20.0,
            ),
            RaisedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/about');
              },
              color: Colors.orange,
              textColor: Colors.white,
              label: Text('Tentang'),
              icon: Icon(Icons.info_outline),
            ),
            SizedBox(
              width: 20.0,
            ),
            RaisedButton.icon(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              color: Colors.red,
              textColor: Colors.white,
              icon: Icon(Icons.lock_open),
              label: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
