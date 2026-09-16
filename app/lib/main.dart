import 'package:flutter/material.dart';

void main() {
  runApp(const HomewardApp());
}

class HomewardApp extends StatelessWidget {
  const HomewardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Homeward',
      home: Scaffold(body: Center(child: Text('Homeward'))),
    );
  }
}
