import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  List<Widget> body = const [
    Icon(Icons.access_time_filled),
    Icon(Icons.bedtime),
    Icon(Icons.add_location),
  ];

  @override
  Widget build(BuildContext context) {
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
                  child: body[currentIndex]), // Show the current selected icon
            ),
          ),
          BottomNavigationBar(
            backgroundColor: Colors.blue[900],
            currentIndex: currentIndex,
            onTap: (int newIndex) {
              setState(() {
                currentIndex = newIndex;
                if (currentIndex == 2) {
                  Navigator.pushNamed(context, '/location');
                }
              });
            },
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.white,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.access_time_filled),
                label: 'Current time',
              ),
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
  }
}
