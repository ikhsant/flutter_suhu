import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String gambar = 'assets/flower2.png';
  String suhusekarang = '';
  String statusAir = '';
  int kadarairsekarang;

  // timer
  void _timer() {
    Future.delayed(Duration(seconds: 3)).then((_) {
      setState(() {
        // getSuhu();
        getKadarAir();
      });
      _timer();
    });
  }

  // get suhu
  // void getSuhu() async {
  //   Response response =
  //       await get('http://ikhsanthohir.id/suhu/suhu_sekarang.php');
  //   Map suhu = jsonDecode(response.body);
  //   // print(suhu);
  //   setState(() {
  //     suhusekarang = suhu['suhu'];
  //   });
  // }

  // get kadar Air
  void getKadarAir() async {
    Response response =
        await get('http://ikhsanthohir.id/suhu/kadarair_sekarang.php');
    Map kadarair = jsonDecode(response.body);
    // print(suhu);
    setState(() {
      kadarairsekarang = int.parse(kadarair['kadarair']);
      if (kadarairsekarang < 40) {
        _showAlert(context);
        gambar = 'assets/flower1.png';
        statusAir = 'Tanaman Kurang Air';
      } else {
        gambar = 'assets/flower2.png';
        statusAir = 'Tanaman Cukup Air';
      }
    });
  }

  void siramTanaman() async {
    Response response = await get('http://ikhsanthohir.id/suhu/siram_tanaman.php');
    _showSuksesSiram(context);
  }

  @override
  void initState() {
    super.initState();
    // getSuhu();
    getKadarAir();
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
              image: AssetImage(gambar),
              height: 150.0,
            ),
            SizedBox(height: 10.0),
            Text(
              '$kadarairsekarang%',
              style: TextStyle(
                fontSize: 50.0,
                letterSpacing: 2.0,
              ),
            ),
            Text(
              'Kadar Air',
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
            SizedBox(height: 14.0),
            Text(
              statusAir,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 20.0),
            RaisedButton.icon(
              onPressed: () {
                _showSiramTanaman(context);
              },
              label: Text('Siram tanaman'),
              icon: Icon(Icons.local_florist),
              color: Colors.purple,
              textColor: Colors.white,
            ),
            SizedBox(width: 10.0),
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
              width: 10.0,
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
              width: 10.0,
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
                // _showAlert(context);
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

  void _showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Tanaman Kurang Air"),
              content: Text("Tanaman kekurangan Air. Segera siram tanaman"),
            ));
  }

  void _showSuksesSiram(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Berhasil"),
              content: Text(
                  "Perintah siram telah berhasil di kirim, tunggu hingga kadar air berubah"),
            ));
  }

  void _showSiramTanaman(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Siram Tanaman"),
              content: Text(
                  "Tanaman Akan disiram otomatis oleh aplikasi, butuh waktu beberapa saat untuk status kadar air berubah"),
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.local_florist),
                  label: Text("SIRAM"),
                  onPressed: () {
                    siramTanaman();
                  },
                )
              ],
            ));
  }

  getStatusAir(int kadarair) {
    if (kadarair > 50) {
      return 'Tanaman Cukup Air';
    } else {
      return 'Tanaman Kurang Air';
    }
  }
}
