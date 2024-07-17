// import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter application"),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: const Center(
        child: Text("Bonjour"),

        // body: Row(
        // children: [
        //   Expanded(
        //     flex: 1,
        //     child: Container(
        //       padding: const EdgeInsets.all(20.0),
        //       color: Colors.blue,
        //       child: const Text("First"),
        //     ),
        //   ),
        //   Expanded(
        //     flex: 1,
        //     child: Container(
        //       padding: const EdgeInsets.all(20.0),
        //       color: Colors.yellow,
        //       child: const Text("Second"),
        //     ),
        //   ),
        //   Expanded(
        //     flex: 1,
        //     child: Container(
        //       padding: const EdgeInsets.all(20.0),
        //       color: Colors.red,
        //       child: const Text("Third"),
        //     ),
        //   ),
        // ],

        // body: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: <Widget>[
        //     const Text("Hello"),
        //     ElevatedButton(
        //         onPressed: () {},
        //         style: ElevatedButton.styleFrom(
        //           backgroundColor: Colors.purple,
        //           foregroundColor: Colors.white,
        //         ),
        //         child: const Text("Click me")),
        //     Container(
        //       color: Colors.amber,
        //       padding: const EdgeInsets.all(20.0),
        //       child: const Text("container"),
        //     ),
        //   ],
        // ),

        // body: Container(
        //   padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        //   margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        //   color: Colors.grey[300],
        //   child: Text('And the Oscar goes for Carameea'),
        // ),

        // child: IconButton(
        //   onPressed: () {},
        //   icon: const Icon(
        //     Icons.table_bar,
        //   ),
        //   style: IconButton.styleFrom(
        //     foregroundColor: Colors.grey
        //   ),
        //   iconSize: 100,
        // )

        // child: ElevatedButton.icon(
        //   onPressed: () {},
        //   icon: const Icon(
        //     Icons.mail
        //   ),
        //   label: const Text('Email'),
        //   style: ElevatedButton.styleFrom(
        //     foregroundColor: Colors.white,
        //     backgroundColor: Colors.blue,
        //   ),
        // ),

        // child: ElevatedButton(
        //   onPressed: () {
        //     print("clicked");
        //   },
        //   style: ElevatedButton.styleFrom(
        //     foregroundColor: Colors.white,
        //     backgroundColor: Colors.blue,
        //   ),
        //   child: const Text('Click me'),
        // ),

        // child: Icon(
        //   Icons.airport_shuttle,
        //   color: Colors.green,
        //   size: 50,
        // ),

        // child: Image.asset("assets/pexels-cliford-mervil-988071-2469122.jpg"),

        // child: Text(
        //   'Oui oui baguette',
        //   style: TextStyle(
        //     fontSize: 20,
        //     fontWeight: FontWeight.bold,
        //     color: Colors.orange,
        //     letterSpacing: 2,
        //     fontFamily: 'name of the font'
        //),
        //),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.grey,
        child: const Text('Button'),
      ),
    );
  }
}
