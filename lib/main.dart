import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Doit',
    theme: ThemeData(
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Colors.amber,
          onPrimary: Color.fromARGB(255, 23, 23, 23),
          secondary: Colors.amber,
          onSecondary: Colors.amber,
          error: Colors.amber,
          onError: Colors.amber,
          background: Colors.amber,
          onBackground: Colors.amber,
          surface: Color(0xFF1F1F1F),
          onSurface: Colors.amber),
      useMaterial3: true,
    ),
    darkTheme: ThemeData(
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
          surface: Color(0xFF1F1F1F),
          onSurface: Colors.amber),
      useMaterial3: true,
    ),
    home: const Home(),
  ));
}
