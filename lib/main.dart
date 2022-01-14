import 'package:flutter/material.dart';
import 'package:pub/app/config/NoGlowBehavior.dart';
import 'package:pub/app/pages/home/home_page.dart';

void main() {
  runApp(
      MaterialApp(
          builder: (context, Widget? child) {
        return ScrollConfiguration(
          behavior: NoGlowBehavior(),
          child: child!,
        );
      },
          debugShowCheckedModeBanner: false,
          title: 'Pub',
          home: HomePage()
      )
  );
}

