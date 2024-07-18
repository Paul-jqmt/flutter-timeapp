import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/pages/boxes.dart';
import 'package:flutter_application_1/pages/time.dart';
import 'package:flutter_application_1/pages/timezone.dart';
import 'dart:convert';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  Widget timezoneTemplate(Timezone timezone) {
    return SizedBox(
      width: 200,
      child: InkWell(
        onTap: () {
          boxTime.putAt(
              0,
              SelectedTimezone(
                offset: timezone.offset,
                mainCity: timezone.mainCity,
                code: timezone.code,
              ));

          Navigator.of(context).pop();
        },
        child: Card(
          margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          color: Colors.blue[600],
          child: Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Text(
                    timezone.offset,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    timezone.mainCity,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    timezone.code,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  List<Timezone> items = [];

  Future<void> readJason() async {
    final String response =
        await rootBundle.loadString('assets/json/timezone.json');
    final data = json.decode(response);
    setState(() {
      items = (data["time_zones"] as List)
          .map((item) => Timezone.fromJson(item))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    readJason();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose your location"),
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.blue[900],
        child: Center(
          child: items.isEmpty
              ? const CircularProgressIndicator()
              : ListView(
                  children: items
                      .map((Timezone item) => timezoneTemplate(item))
                      .toList(),
                ),
        ),
      ),
    );
  }
}
