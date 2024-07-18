import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/boxes.dart';
import 'package:flutter_application_1/pages/time.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  String timeDisplay = '';
  SelectedTimezone selectedTimezone = SelectedTimezone(
    offset: 'UTC ${DateTime.now().timeZoneOffset.toString()}',
    mainCity: '',
    code: DateTime.now().timeZoneName,
  );

  @override
  void initState() {
    timeDisplay = DateFormat('Hm').format(DateTime.now()).toString();
    Timer.periodic(const Duration(seconds: 1), (Timer t) => getTime());

    super.initState();
  }

  List<Widget> body = const [
    Icon(Icons.access_time_filled),
    Icon(Icons.bedtime),
    Icon(Icons.add_location),
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: boxTime.listenable(),
      builder: (context, box, widget) {
        selectedTimezone = boxTime.getAt(0);

        return Scaffold(
          appBar: AppBar(
            title: const Text("Your current time location"),
            backgroundColor: Colors.blue[900],
            foregroundColor: Colors.white,
            automaticallyImplyLeading: false,
          ),
          body: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/Ex39Su.png"),
                          fit: BoxFit.cover)),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          timeDisplay,
                          style: TextStyle(
                            color: Colors.blue[400],
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0,
                          ),
                        ),
                        Text(
                          //'Location',
                          selectedTimezone.mainCity as String,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              BottomNavigationBar(
                backgroundColor: Colors.blue[900],
                currentIndex: currentIndex,
                onTap: (int newIndex) {
                  setState(() {
                    currentIndex = newIndex;
                    if (currentIndex == 1) {
                      Navigator.pushNamed(context, '/location');
                    }
                  });
                },
                unselectedItemColor: Colors.white,
                selectedItemColor: Colors.white,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.bedtime),
                    label: 'Theme',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.add_location),
                    label: 'Change timezone',
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void getTime() {
    final DateTime now = DateTime.now();
    setState(() {
      timeDisplay = DateFormat('Hm').format(now).toString();
      // print(selectedTimezone.mainCity);
    });
  }
}
