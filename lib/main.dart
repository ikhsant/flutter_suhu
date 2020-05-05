import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/about.dart';
import 'pages/monitoring.dart';
import 'pages/login.dart';
import 'pages/laporan.dart';
import 'pages/laporan_table.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/login',
  routes: {
    '/home' : (context) => Home(),
    '/about' : (context) => About(),
    '/monitoring' : (context) => Monitoring(),
    '/laporan' : (context) => Laporan(),
    '/laporan_table' : (context) => LaporanTable(),
    '/login' : (context) => Login(),
    },
));

