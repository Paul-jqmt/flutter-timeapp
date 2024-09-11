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
    offset: DateTime.now().toLocal().timeZoneOffset.toString(),
    mainCity: '',
    code: DateTime.now().toLocal().timeZoneName,
  );

  @override
  void initState() {
    boxTime.putAt(0, selectedTimezone);
    timeDisplay = DateFormat('Hm').format(DateTime.now().toLocal()).toString();
    Timer.periodic(const Duration(seconds: 1), (Timer t) => getTime());

    super.initState();
  }

  List<Widget> body = const [
    Icon(Icons.settings),
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
                  padding: const EdgeInsets.all(40.0),
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
                          selectedTimezone.code.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
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
                    icon: Icon(Icons.settings),
                    label: 'Settings',
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
    DateTime time = DateTime.now().toUtc();
    String offset = selectedTimezone.offset!.replaceAll(RegExp('[UTC:]'), '');

    int offsetHours = offset[0] != '-' && offset[0] != '+' ? int.parse(offset[0]) : int.parse(offset[1] + offset[2]);
    int offsetMinutes = int.parse(offset[3] + offset[4]);
    
    if(offset[0] == '-') {
      time = time.subtract(Duration(hours: offsetHours, minutes: offsetMinutes));
    } else {
      time = time.add(Duration(hours: offsetHours, minutes: offsetMinutes));
    }

    setState(() {
      timeDisplay = DateFormat('Hm').format(time).toString();
    });
  }
}
