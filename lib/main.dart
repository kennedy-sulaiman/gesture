import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gesture Detector",
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final double boxSize = 150.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Gesture Detection"),
        ),
        body: Center(
          child: Container(
            width: boxSize,
            height: boxSize,
            decoration: const BoxDecoration(color: Colors.red),
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.yellow,
          padding: const EdgeInsets.all(10.0),
          child: Text("Taps 0 - Double Taps 0 - Long Press 0",
              style: Theme.of(context).textTheme.headline6),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          icon: const Icon(Icons.restore),
          label: const Text("Reset"),
        ));
  }
}
