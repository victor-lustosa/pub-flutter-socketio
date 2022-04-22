import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pub/app/core/configs/app_colors.dart';
import 'package:pub/app/pages/user/models/user.dart';


import '../../../core/room_bloc/room_bloc.dart';
import '../models/bloc_events.dart';
import '../models/data/message_data.dart';
import '../models/room.dart';

abstract class IRoomViewModel{
  sendMessage(RoomBloc bloc);
}

class RoomViewModel extends ChangeNotifier implements IRoomViewModel{

  RoomViewModel({required Room room, required User user}): _room = room, _user = user;
  RoomViewModel.withoutParameters();

  final ScrollController scrollController = ScrollController();
  final focusNode = FocusNode();
  final textController = TextEditingController(text: '');
  // late bool boolAdd;
  Room _room = Room.withoutParameters();
  User _user = User.withoutParameters();
  bool isExist = false;
  int lineNumbers = 1;
  bool isVisibled = false;

  sendMessage(RoomBloc bloc){

    String textMessage = textController.text;

    if (textMessage.isNotEmpty) {

      var mes = MessageData(
          createdAt: DateTime.now().toString(),
          idMessage: 0,
          textMessage: textMessage,
          user: this._user.getNickname,
          code:44,
          type: BlocEventType.send_message);

      _room.getMessagesList.add(mes);

      bloc.add(SendMessageEvent(mes.toMap()));
      focusNode.requestFocus();
      textController.clear();
      focusNode.requestFocus();
    }
  }

  void dispose() {
    super.dispose();
    textController.dispose();
    focusNode.dispose();
    scrollController.dispose();
  }

  Alignment alignment(index){
    if(_room.getMessagesList[index].getUser != ''){
      if(_room.getMessagesList[index].getUser != _user.getNickname){
        return  Alignment.centerLeft;
      } else{
        return Alignment.centerRight;
      }
    } else{
      return Alignment.center;
    }
  }
  Color color(index){
    if(_room.getMessagesList[index].getUser != ''){
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
      this.scrollController.jumpTo(
          this.scrollController.position.maxScrollExtent
      );
    });
    if(state.message.type != BlocEventType.user_enter_public_room || state.message.type != BlocEventType.broad_enter_public_room){
        return  Center(child: Text('${_room.getParticipantsList[index].getTextMessage}'));
    } else{
      return Text('${_room.getMessagesList[index].getUser} - ${_room.getMessagesList[index].getTextMessage}');
    }
  }
  void addParticipants(dynamic data) {
    for(dynamic participant in _room.getParticipantsList){
     if(data.getNickname == participant.getNickname) {
       isExist = true;
     }
    }
    if(!isExist){
      _room.addParticipants(data);
      notifyListeners();
    }
  }

  get getUser => _user;
  get getRoom => _room;
}


