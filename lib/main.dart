import 'package:flutter/material.dart';
import 'package:pub/pages/home_app/home_app.dart';

void main() {
  runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Pub',
          home: HomeApp()
      )
  );
}

