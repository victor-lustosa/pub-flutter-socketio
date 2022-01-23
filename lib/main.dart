import 'package:flutter/material.dart';

import 'package:pub/app/pages/home/home_page.dart';

import 'app/shared/config/no_glow_behavior.dart';

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

