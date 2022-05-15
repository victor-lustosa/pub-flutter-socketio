
import 'package:flutter/material.dart';
import 'package:pub/app/pages/participant/models/dto/participant_dto.dart';

import '../../pages/establishment/models/dto/establishment_dto.dart';
import '../../pages/establishment/views/establishment_page.dart';
import '../../pages/home/views/home_page.dart';
import '../../pages/participant/views/participant_page.dart';
import '../../pages/room/models/dto/room_dto.dart';
import '../../pages/room/views/room_page.dart';
import '../../pages/user/models/user.dart';
import '../../pages/user/views/user_register_page.dart';
const urlServer = 'https://powerful-bayou-46345.herokuapp.com';
// const urlServer = 'http://localhost:4000';
class AppRoutes{
  static const String INICIAL_ROUTE = "/";
  static const String HOME_ROUTE = "/home";
  static const String USER_REGISTER_ROUTE = "/user_register";
  static const String EDIT_USER_ROUTE = "/edit_user";
  static const String ENTERPRISE_REGISTER_ROUTE = "/enterprise_register";
  static const String ESTABLISHMENT_ROUTE = "/establishments";
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
          // builder: (_) => EstablishmentPage(establishmentDTO.getUser, establishmentDTO.getEstablishment));
            builder: (_) => EstablishmentPage(establishmentDTO.getUser));

      case USER_REGISTER_ROUTE:
        return MaterialPageRoute(
            builder: (_) =>  UserRegisterPage(User.withoutParameters()));

    // case ENTERPRISE_REGISTER_ROUTE:
    //   return MaterialPageRoute(
    //       builder: (_) =>  EnterpriseRegisterPage());
      case EDIT_USER_ROUTE:
        User user = arguments as User;
        return MaterialPageRoute(
            builder: (_) =>  UserRegisterPage(user));

      case PUBLIC_ROOM_ROUTE:
        RoomDTO roomDTO = arguments as RoomDTO;
        return MaterialPageRoute(
            builder: (_) => RoomPage(roomDTO.getBloc, roomDTO.getRoomViewModel));

      case PRIVATE_ROOM_ROUTE:
        ParticipantDTO participantDTO = arguments as ParticipantDTO;
        return MaterialPageRoute(
            builder: (_) => ParticipantPage(participantDTO.getBloc, participantDTO.getParticipantViewModel));

      default:
        _unknownRoute();
    }
    return null;
  }
  static Route<dynamic>_unknownRoute(){
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