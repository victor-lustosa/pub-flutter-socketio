import 'package:flutter/material.dart';
import 'package:pub/app/participant/models/dto/participant_dto.dart';

import '../../establishment/models/dto/establishment_dto.dart';
import '../../establishment/views/establishment_page.dart';
import '../../home/views/home_page.dart';
import '../../participant/views/participant_page.dart';
import '../../room/models/dto/room_dto.dart';
import '../../room/views/room_page.dart';
import '../../user/models/user.dart';
import '../../user/views/user_register_page.dart';

const urlServer = 'https://powerful-bayou-46345.herokuapp.com';

// const urlServer = 'http://localhost:4000';
class AppRoutes {
  static const String initialRoute = "/";
  static const String homeRoute = "/home";
  static const String userRegisterRoute = "/user_register";
  static const String editUserRoute = "/edit_user";
  static const String enterpriseRegisterRoute = "/enterprise_register";
  static const String establishmentRoute = "/establishments";
  static const String publicRoomRoute = "/public_room";
  static const String privateRoomRoute = "/private_room";

  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    final arguments = routeSettings.arguments;

    switch (routeSettings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());

      case initialRoute:
        return MaterialPageRoute(builder: (_) => HomePage());

      case establishmentRoute:
        EstablishmentDTO establishmentDTO = arguments as EstablishmentDTO;
        return MaterialPageRoute(
            // builder: (_) => EstablishmentPage(establishmentDTO.getUser, establishmentDTO.getEstablishment));
            builder: (_) => EstablishmentPage(establishmentDTO.getUser));

      case userRegisterRoute:
        return MaterialPageRoute(
            builder: (_) => UserRegisterPage(User.withoutParameters()));

      // case ENTERPRISE_REGISTER_ROUTE:
      //   return MaterialPageRoute(
      //       builder: (_) =>  EnterpriseRegisterPage());
      case editUserRoute:
        User user = arguments as User;
        return MaterialPageRoute(builder: (_) => UserRegisterPage(user));

      case publicRoomRoute:
        RoomDTO roomDTO = arguments as RoomDTO;
        return MaterialPageRoute(
            builder: (_) => RoomPage(roomDTO.getBloc, roomDTO.getRoomViewModel,
                roomDTO.getParticipantViewModel));

      case privateRoomRoute:
        ParticipantDTO participantDTO = arguments as ParticipantDTO;
        return MaterialPageRoute(
            builder: (_) => ParticipantPage(participantDTO.getBloc,
                participantDTO.getParticipantViewModel));

      default:
        _unknownRoute();
    }
    return null;
  }

  static Route<dynamic> _unknownRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Rota não encontrada"),
        ),
        body: Center(
          child: Text("tela não encontrada"),
        ),
      );
    });
  }
}
