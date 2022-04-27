import 'dart:async';
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:pub/app/core/configs/app_colors.dart';
import 'package:pub/app/pages/user/models/user.dart';
import 'package:geolocator/geolocator.dart';

import '../../../core/room_bloc/room_bloc.dart';
import '../models/bloc_events.dart';
import '../models/data/enter_public_room_data.dart';
import '../models/data/message_data.dart';
import '../models/room.dart';

abstract class IRoomViewModel{
  getPosition();
  sendMessage(RoomBloc bloc);
}

class RoomViewModel extends ChangeNotifier implements IRoomViewModel{

  RoomViewModel({required this.scrollViewController, required User user,required Room room}): _user = user, _room = room{
    getPosition();
  }
  final ScrollController scrollViewController;

  final focusNode = FocusNode();
  final textController = TextEditingController(text: '');
  // late bool boolAdd;
  String error = '';
  List<dynamic> _roomsList = [];
  Room _room;
  User _user;
  bool isExist = false;
  int lineNumbers = 1;
  bool isVisibled = false;

  sendMessage(RoomBloc bloc){

    String textMessage = textController.text;

    if (textMessage.isNotEmpty) {

      var mes = MessageData(
          idRoom: this.getRoom.getIdRoom,
          createdAt: DateTime.now().toString(),
          roomName: this.getRoom.getRoomName,
          idMessage: '',
          textMessage: textMessage,
          user: this.getUser.getNickname,
          code: 0,
          type: BlocEventType.send_message);

      _room.getMessagesList.add(mes);

      bloc.add(SendMessageEvent(mes.toMap()));
      focusNode.requestFocus();
      textController.clear();
      focusNode.requestFocus();
    }
  }
  checkAccessToLocation() async{
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission != LocationPermission.denied){
        return;
      }
    }
    if(permission == LocationPermission.deniedForever){
      permission = await Geolocator.requestPermission();
      if(permission != LocationPermission.deniedForever){
        return;
      }
    }
  }
 void getPosition() async{
    // try{
    //   bool active = await Geolocator.isLocationServiceEnabled();
    //   if(!active){
    //    checkAccessToLocation();
    //   }
      // Position position = await Geolocator.getCurrentPosition();
      // developer.log('log latitude: ${position.latitude.toString()}');
      // getUser.setLatitude(position.latitude);
      // developer.log('log longitude: ${position.longitude.toString()}');
      // getUser.setLongitude(position.longitude);
      getUser.setLatitude(-10.182325978880673);
      getUser.setLongitude(-48.33803205711477);
    // }catch(e){
    //   error = e.toString();
    // }
  }
  // Future<Position> _currentPosition() async{
  //   bool active = await Geolocator.isLocationServiceEnabled();
  //   if(!active){
  //     return Future.error('Por favor, habilite a localizacao');
  //   }
  //   return await Geolocator.getCurrentPosition();
  // }
  void dispose() {
    super.dispose();
    textController.dispose();
    focusNode.dispose();
    scrollViewController.dispose();
  }

  Alignment alignment(state,index){
    if(state is SendMessageState || state is ReceiveMessageState) {
      if(_room.getMessagesList[index].getUser != _user.getNickname){
        return  Alignment.centerLeft;
      } else{
        return Alignment.centerRight;
      }
    } else{
      return Alignment.center;
    }
  }
  Color color(state,index){
    if(state is SendMessageState || state is ReceiveMessageState) {
      if(_room.getMessagesList[index].getUser != _user.getNickname){
        return  Colors.white;
      } else{
        return Color(0xffdcd9d9);
      }
    } else {
      return AppColors.lightBrown;
    }
  }

  typeMessage(state, index) {
    Timer(Duration(microseconds: 50), (){
      this.scrollViewController.jumpTo(
          this.scrollViewController.position.maxScrollExtent
      );
    });
    if(state is SendMessageState || state is ReceiveMessageState) {
      return Text('${_room.getMessagesList[index].getUser} - ${_room.getMessagesList[index].getTextMessage}');
    } else if(state is ReceiveBroadEnterPublicRoomMessageState || state is ReceiveUserEnterPublicRoomMessageState){
        return  Center(child: Text('${state.message.getUser.getNickName} entrou na sala'));
      }
    }

  void addParticipants(EnterPublicRoomData data) {
    for(dynamic room in _roomsList){
      if(room.getRoomName == data.getRoomName){
        room.addParticipants(data.getUser);
      }
    }
  }
  addRoom(Room room){
    _roomsList.add(room);
  }
  get getUser => _user;
  get getRoom => _room;
  get getRoomsList => _roomsList;

  setRoom(Room room) => _room = room;
  setUser(User user) => _user = user;
  setRoomsList(List<dynamic> roomsList) => _roomsList = roomsList;

}


