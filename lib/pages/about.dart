import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 50.0),
            Image(
              image: AssetImage('assets/suhu.png'),
              height: 100.0,
            ),
            SizedBox(height: 10.0),
            Text(
              'Aplikasi Pendeteksi Suhu @Rasbery-Pi',
              style: TextStyle(
                fontSize: 20.0,
                letterSpacing: 2.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50.0),
            Text(
              'Kelompok 2:',
              style: TextStyle(
                fontSize: 20.0,
                letterSpacing: 2.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0),
            Text(
              'Muhammad Ikhsan Thohir',
              style: TextStyle(
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'Princi Sabri',
              style: TextStyle(
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'M Labib Langlangbuana',
              style: TextStyle(
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'Kamdan',
              style: TextStyle(
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'Ivana Luciana',
              style: TextStyle(
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
            
          ],
        ),
      ),
    );
  }
}
