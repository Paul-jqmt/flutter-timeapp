import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/loading.dart';
import 'package:flutter_application_1/pages/location.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const Home(),
      '/location': (context) => const Location(),
    },
    debugShowCheckedModeBanner: false,
  ));
}
