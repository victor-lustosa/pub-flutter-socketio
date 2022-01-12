import 'package:flutter/material.dart';
import 'package:pub/app/pages/home_page.dart';

void main() {
  runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Pub',
          home: HomePage()
      )
  );
}

