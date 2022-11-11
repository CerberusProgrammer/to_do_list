import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Doit',
    theme: ThemeData.light(
      useMaterial3: true,
    ),
    home: const Home(),
  ));
}
