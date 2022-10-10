import 'package:flutter/material.dart';
import 'package:pub/app/core/configs/app_routes.dart';
import 'package:pub/app/core/configs/no_glow_behavior.dart';
import 'package:pub/app/splash/views/splash_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, Widget? child) {
        return ScrollConfiguration(
          behavior: NoGlowBehavior(),
          child: child!,
        );
      },
      initialRoute: "/",
      onGenerateRoute: AppRoutes.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      title: 'Pub',
      home: SplashPage(),
    );
  }
}
