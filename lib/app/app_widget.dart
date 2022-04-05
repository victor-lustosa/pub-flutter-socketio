import 'package:flutter/material.dart';
import 'package:pub/app/core/configs/app_routes.dart';
import 'package:pub/app/core/configs/no_glow_behavior.dart';
import 'package:pub/app/pages/home/views/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pub/app/pages/room/bloc/message_bloc.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<MessageBloc>(
            create: (context) => MessageBloc(),
          ),
        ], child: MaterialApp(
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
      home: HomePage(),
    )
    );
  }
}
