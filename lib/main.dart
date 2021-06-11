import 'package:flutter/material.dart';
import 'package:pub/pages/home_app/app_home.dart';

void main() {
  runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Pub',
          home: AppHome()
      )
  );
}

