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
  int numTaps = 0;
  int doubleTaps = 0;
  int longPress = 0;

  double posX = 0;
  double posY = 0;

  void center(BuildContext context) {
    double posX = (MediaQuery.of(context).size.width / 2) - (boxSize / 2);
    double posY = (MediaQuery.of(context).size.height / 2) - (boxSize / 2) - 30;

    setState(() {
      this.posX = posX;
      this.posY = posY;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (posX == 0) center(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Gesture Detection"),
        ),
        body: Stack(children: [
          Positioned(
              top: posY,
              left: posX,
              child: GestureDetector(
                child: Container(
                  width: boxSize,
                  height: boxSize,
                  decoration: const BoxDecoration(color: Colors.red),
                ),
                onTap: () {
                  setState(() {
                    numTaps++;
                  });
                },
                onDoubleTap: () {
                  setState(() {
                    doubleTaps++;
                  });
                },
                onLongPress: () {
                  setState(() {
                    longPress++;
                  });
                },
                // onVerticalDragUpdate: (DragUpdateDetails details) {
                //   setState(() {
                //     double delta = details.delta.dy;
                //     posY += delta;
                //   });
                // },
                // onHorizontalDragUpdate: (DragUpdateDetails details) {
                //   setState(() {
                //     double delta = details.delta.dx;
                //     posX += delta;
                //   });
                // },
                onPanUpdate: (DragUpdateDetails details) {
                  setState(() {
                    double deltaX = details.delta.dx;
                    double deltaY = details.delta.dy;
                    posX += deltaX;
                    posY += deltaY;
                  });
                },
              ))
        ]),
        bottomNavigationBar: Container(
          color: Colors.yellow,
          padding: const EdgeInsets.all(10.0),
          child: Text(
              "Taps $numTaps - Double Taps $doubleTaps - Long Press $longPress",
              style: Theme.of(context).textTheme.headline6),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            numTaps = 0;
            doubleTaps = 0;
            longPress = 0;
          },
          icon: const Icon(Icons.restore),
          label: const Text("Reset"),
        ));
  }
}
