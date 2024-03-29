import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pub/app/pages/participant/models/participant.dart';
import 'package:pub/app/pages/user/models/user.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'dart:developer' as developer;
//import '../../../core/configs/app_routes.dart';
import '../../../core/room_bloc/room_bloc.dart';
//import '../../establishment/models/dto/establishment_dto.dart';
import '../models/bloc_events.dart';
import '../models/data/message_data.dart';
import '../models/data/public_room_data.dart';
import '../models/room.dart';

abstract class IRoomViewModel {
  getPosition();
  sendMessage(RoomBloc bloc);
}

class RoomViewModel extends ChangeNotifier implements IRoomViewModel {
  RoomViewModel({required User user, required Room room})
      : _user = user,
        _room = room;

  late StreamSubscription subscription;

  final Uri _url = Uri.parse(
      'https://docs.google.com/forms/d/e/1FAIpQLSdpXQ6umKF2-aOZcqpwMrlZkiiPYgVGZYY_WKZS9gB2H7V8HA/viewform?usp=sf_link');
  final focusNode = FocusNode();
  final textController = TextEditingController(text: '');
  // late bool boolAdd;
  String error = '';
  List<dynamic> _rooms = [];
  Room _room;
  User _user;
  bool isParticipantExist = false;
  bool isUserExist = false;
  int lineNumbers = 1;
  String messageText = '';
  // String userMessageText = '';
  // bool isVisibled = false;
  /*verifyLocation(BuildContext context,RoomBloc bloc){
    subscription = Geolocator.getPositionStream(
        locationSettings: LocationSettings(accuracy: LocationAccuracy.best, timeLimit: Duration(minutes: 2))
    ).listen((position) {
      double distance = (Geolocator.distanceBetween(position.latitude, position.longitude, getRoom.getLatitude, getRoom.getLongitude) / 1000);
      if(distance > 10.2){
        bloc.add(LeaveRoomEvent());
        Navigator.pushNamed(context, AppRoutes.establishmentRoute, arguments:EstablishmentDTO(getUser));
        subscription.cancel();
      }
    });
  }*/

  sendMessage(RoomBloc bloc) {
    String textMessage = textController.text;

    if (textMessage.isNotEmpty) {
      var mes = MessageData(
          idRoom: this.getRoom.getIdRoom,
          createdAt: DateTime.now().toString(),
          roomName: this.getRoom.getRoomName,
          idMessage: '',
          textMessage: textMessage.trimLeft().trimRight(),
          user: this.getUser,
          code: 460,
          type: BlocEventType.send_public_message);

      _room.getMessages.add(mes);

      bloc.add(SendMessageEvent(mes.toMap()));
      focusNode.requestFocus();
      textController.clear();
      focusNode.requestFocus();
    }
  }

  Future<void> getPosition() async {
    //Position position = await Geolocator.getCurrentPosition( desiredAccuracy: LocationAccuracy.best);
    // developer.log('log latitude: ${position.latitude.toString()}');
    //getUser.setLatitude(position.latitude);
    //  developer.log('log longitude: ${position.longitude.toString()}');
    //  getUser.setLongitude(position.longitude);
    getUser.setLatitude(-10.186126159199715);
    getUser.setLongitude(-48.32988348861608);
  }

  verifyParticipants(room, data) {
    for (dynamic participant in room.getParticipants) {
      if (data.getUser.getNickname == participant.getNickname) {
        isParticipantExist = true;
      }
    }
  }

  bool verifyNameUser(Room room) {
    for (dynamic participant in room.getParticipants) {
      if (getUser.getNickname == participant.getNickname) {
        isUserExist = true;
      }
    }
    return isUserExist;
  }

  void addParticipants(PublicRoomData data) {
    if (data.getUser.getNickname == getUser.getNickname) {
      getUser.setIdUser(data.getUser.getIdUser);
      getRoom.setIdRoom(data.getIdRoom);
    } else {
      for (dynamic room in _rooms) {
        if (room.getIdRoom == data.getIdRoom) {
          verifyParticipants(room, data);
          if (!isParticipantExist) {
            room.addParticipants(
                Participant.convertUserToParticipant(data.getUser));
          }
        }
        isParticipantExist = false;
      }
    }
    notifyListeners();
  }

  void removeParticipants(PublicRoomData data) {
    for (dynamic room in _rooms) {
      if (room.getIdRoom == data.getIdRoom) {
        room.removeParticipants(
            Participant.convertUserToParticipant(data.getUser));
      }
    }
    notifyListeners();
  }

  double distanceBetweenUserAndEstablishments(
      User user, double latitude, double longitude) {
    return (Geolocator.distanceBetween(
            user.getLatitude, user.getLongitude, latitude, longitude) /
        1000);
  }

  addMessages(message) {
    if (message.getTextMessage != messageText) {
      messageText = message.getTextMessage;
      // userMessageText = message.getUser.getNickname;
      getRoom.addMessages(message);
    }
  }

  fetchedRooms(message) {
    _rooms = [];
    for (dynamic roomData in message.getRooms) {
      Room room = Room.fromMinimalMap(roomData);
      room.setDistance(distanceBetweenUserAndEstablishments(
          getUser, room.getLatitude, room.getLongitude));
      _rooms.add(room);
    }
  }

  bool isAcceptedLocation(room) {
    double result = distanceBetweenUserAndEstablishments(
        getUser, room.getLatitude, room.getLongitude);
    if (result <= 0.3)
      return true;
    else
      return false;
  }

  openURL(BuildContext context) async {
    if (await canLaunchUrl(_url))
      await launchUrl(_url);
    else
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Não foi possivel abrir a página')));
  }

  void delayForForms(BuildContext context) async {
    await Future.delayed(const Duration(minutes: 30));
    openURL(context);
  }

  get getUser => _user;
  get getRoom => _room;
  get getRooms => _rooms;

  setRoom(Room room) => _room = room;
  setUser(User user) => _user = user;

  void dispose() {
    subscription.cancel();
    textController.dispose();
    focusNode.dispose();
    super.dispose();
  }
}
