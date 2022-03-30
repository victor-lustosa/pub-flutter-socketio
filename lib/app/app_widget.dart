import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pub/app/pages/home/home_page.dart';
import 'package:pub/app/core/components/interceptor_server.dart';
import 'package:pub/app/core/config/app_routes.dart';
import 'package:pub/app/core/config/no_glow_behavior.dart';
import 'package:pub/app/pages/room/view_models/room_view_model.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [

            Provider<RoomViewModel>(create: (context)=> RoomViewModel(context.read(),context.read(),context.read())),
            ChangeNotifierProvider<InterceptorServer>(create: (_) => InterceptorServer()),
        ],
        child:MaterialApp(
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
