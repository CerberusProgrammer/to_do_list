import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Doit',
    theme: ThemeData(
      colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Colors.amber,
          onPrimary: Color.fromARGB(255, 255, 255, 255),
          secondary: Colors.amber,
          onSecondary: Colors.amber,
          error: Colors.amber,
          onError: Colors.amber,
          background: Colors.amber,
          onBackground: Colors.amber,
          surface: Color.fromARGB(255, 31, 31, 31),
          onSurface: Colors.amber),
      useMaterial3: true,
    ),
    home: const Home(),
  ));
}
