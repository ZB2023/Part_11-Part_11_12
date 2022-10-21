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
    double radius = 10;

    Path path = Path()
      ..addRRect(RRect.fromLTRBR(0, 0, 60, 60, Radius.circular(radius)))
      ..addRRect(RRect.fromRectAndRadius(
          Rect.fromLTWH(0, size.height - 50, 50, 50), Radius.circular(radius)))
      ..addRRect(RRect.fromRectAndCorners(
          Rect.fromCircle(
              center: Offset(size.width / 2, size.height / 2), radius: 30),
          topLeft: Radius.circular(radius)))
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
