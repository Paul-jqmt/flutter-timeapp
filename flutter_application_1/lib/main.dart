import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/loading.dart';
import 'package:flutter_application_1/pages/location.dart';
import 'package:flutter_application_1/pages/time.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'pages/boxes.dart';

Future<void> main() async {
  await Hive.initFlutter();
  
  Hive.registerAdapter(TimeAdapter());
  boxTime = await Hive.openBox<SelectedTimezone>('timeBox');

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
