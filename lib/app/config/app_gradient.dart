import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class AppGradients {
  static final linear = LinearGradient(colors: [
    Color(0xFF085AB9), Color(0xFF03D0D0)],
      stops: [ 0.0, 2.4 ],
      transform: GradientRotation(-2.13 * pi));
}