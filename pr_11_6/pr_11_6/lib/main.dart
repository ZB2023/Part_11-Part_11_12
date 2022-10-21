import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipPath(
          clipper: MyCustomClipper(),
          child: Container(
            width: 200.0,
            height: 200.0,
            color: Colors.pink,
          ),
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 50;

    Path path = Path()
      ..lineTo(size.width - radius, 0)
      ..arcTo(
          Rect.fromPoints(Offset(size.width - radius, 0),
              Offset(size.width, radius)), // Rect
          1.5 * pi, // начальный угол
          0.5 * pi, // конечный угол
          true) // направление по часовой стрелке
      ..lineTo(size.width, size.height - radius)
      ..arcTo(
          Rect.fromCircle(
              center: Offset(size.width - radius, size.height - radius),
              radius: radius),
          0,
          0.5 * pi,
          false)
      ..lineTo(radius, size.height)
      ..arcTo(Rect.fromLTRB(0, size.height - radius, radius, size.height),
          0.5 * pi, 0.5 * pi, false)
      ..lineTo(0, radius)
      ..arcTo(Rect.fromLTWH(0, 0, 70, 100), 1 * pi, 0.5 * pi, false)
      ..close();

    @override
    bool shouldReclip(CustomClipper<Path> oldClipper) => false;
  }
}
