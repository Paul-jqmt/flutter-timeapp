import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/preferences.dart';
import 'package:flutter_application_1/modules/preferences_adapter.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/loading.dart';
import 'package:flutter_application_1/pages/location.dart';
import 'package:flutter_application_1/pages/settings.dart';
import 'package:flutter_application_1/pages/time.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'pages/boxes.dart';

Future<void> main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(TimeAdapter());
  Hive.registerAdapter(PreferenceAdapter());

  boxTime = await Hive.openBox<SelectedTimezone>('timeBox');
  boxPreference = await Hive.openBox<Preference>('preferenceox');

  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const Home(),
      '/theme': (context) => const Settings(),
      '/location': (context) => const Location(),
    },
    debugShowCheckedModeBanner: false,
  ));
}
