import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pub/app/pages/home/home_page.dart';
import 'package:pub/app/repositories/establishment_repository.dart';
import 'package:pub/app/shared/components/interceptor_server.dart';
import 'package:pub/app/shared/config/app_routes.dart';
import 'package:pub/app/shared/config/no_glow_behavior.dart';
import 'package:pub/app/view_models/establishment_view_model.dart';

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


          Provider<Dio>(create: (_)=> Dio()),
          Provider<EstablishmentViewModel>(create: (_)=> EstablishmentViewModel(context.read(),context.read())),
          Provider<DioEstablishmentRepository>(create: (_)=> DioEstablishmentRepository(context.read())),
          ChangeNotifierProvider<InterceptorServer>(create: (context) => InterceptorServer(socket: context.read()))
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
