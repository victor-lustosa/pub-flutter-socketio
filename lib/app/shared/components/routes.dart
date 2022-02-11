import 'package:flutter/material.dart';
import 'package:pub/app/models/dto/establishment_dto.dart';
import 'package:pub/app/models/establishment.dart';
import 'package:pub/app/models/user.dart';
import 'package:pub/app/pages/establishment/establishment_page.dart';
import 'package:pub/app/pages/home/home_page.dart';
import 'package:pub/app/pages/user/user_register_page.dart';

import '../../models/room.dart';
import '../../pages/room/room_page.dart';
import '../../pages/user/enterprise_register_page.dart';


class Routes{

  static const String INICIAL_ROUTE = "/";
  static const String HOME_ROUTE = "/home";
  static const String USER_REGISTER_ROUTE = "/user_register";
  static const String ENTERPRISE_REGISTER_ROUTE = "/enterprise_register";
  static const String ESTABLISHMENT_ROUTE = "/establishment_list";
  static const String PUBLIC_ROOM_ROUTE = "/public_room";
  static const String PRIVATE_ROOM_ROUTE = "/private_room";

  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings){
   final arguments =  routeSettings.arguments;

   switch(routeSettings.name){

    case HOME_ROUTE:
      return MaterialPageRoute(
          builder: (_) =>  HomePage());

      case INICIAL_ROUTE:
        return MaterialPageRoute(
            builder: (_) =>  HomePage());

      case ESTABLISHMENT_ROUTE:
        EstablishmentDTO establishmentDTO = arguments as EstablishmentDTO;
        return MaterialPageRoute(
            builder: (_) => EstablishmentPage(establishmentDTO.user, establishmentDTO.establishment));

      case USER_REGISTER_ROUTE:
        return MaterialPageRoute(
            builder: (_) =>  UserRegisterPage());

      case ENTERPRISE_REGISTER_ROUTE:
        return MaterialPageRoute(
            builder: (_) =>  EnterpriseRegisterPage());

      case PUBLIC_ROOM_ROUTE:
        EstablishmentDTO establishmentDTO = arguments as EstablishmentDTO;
        return MaterialPageRoute(
            builder: (_) => RoomPage(establishmentDTO.establishment, establishmentDTO.user));

      default:
        _erroRota();
    }
  }
  static Route<dynamic>_erroRota(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(title: Text("Rota não encontrada"),),
        body: Center(
          child: Text("tela não encontrada"),
        ),
      );
    });
  }
}