import 'package:flutter/material.dart';
import 'quote.dart';

void main() {
  runApp(const MaterialApp(
    home: MyWidget(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<Quote> quotes = [
    Quote(brand: "yamaha", model: "MT-07"),
    Quote(brand: "ktm", model: "890r"),
    Quote(brand: "ducati", model: "streetfighter")
  ];

  Widget quoteTemplate(quote) {
    return SizedBox(
      width: 200,
      child: Card(
        margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Text(
                  quote.brand,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  quote.model,
                  style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                )
              ],
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[900],
      appBar: AppBar(
        title: const Text('Current time Application !'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: quotes.map((quote) => quoteTemplate(quote)).toList(),
        ),
      ),
    );
  }
}
