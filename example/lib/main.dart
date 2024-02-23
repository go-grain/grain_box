import 'package:flutter/material.dart';
import 'dart:async';

import 'package:grain_box/widget/card/default_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late int sumResult;
  late Future<int> sumAsyncResult;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Packages'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                GDefaultCard(
                  child: Container(
                      margin: const EdgeInsets.all(20),
                      child: const Text("Hello")),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
