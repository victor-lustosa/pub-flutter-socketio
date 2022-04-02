
// import 'package:rx_notifier/rx_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pub/app/core/components/interceptor_server.dart';
import 'package:pub/app/pages/user/models/user.dart';

import '../../../core/models/data/data.dart';
import '../models/room.dart';

abstract class IRoomViewModel{
  // sendMessage();
}

class RoomViewModel implements IRoomViewModel{
  RoomViewModel(this.room, this.user, this.interceptor){
    interceptor.initClientServer(this.room.getRoomName, this.user.getNickname);
  }
  InterceptorServer interceptor;
  final focusNode = FocusNode();
  List<dynamic> _usersList = [];
  List<dynamic> _messagesList = [];
  late final Room room;
  late final User user;
  int lineNumbers = 1;

  final textController = TextEditingController(text: '');

  void sendMessage() {

    String textMessage = textController.text;

    if (textMessage.isNotEmpty) {
      interceptor.sendMessage(textMessage, user.getNickname);
      textController.clear();
      focusNode.requestFocus();
    }
  }

  get getUsersList => _usersList;

  set usersList(List<dynamic> value) {
    _usersList = value;
  }
  get getMessagesList => _messagesList;
  addMessage(Data initialMessageData) {
    _messagesList.add(initialMessageData);
  }

  dispose(){
    interceptor.dispose();
    textController.dispose();
    focusNode.dispose();
  }

  static dynamic comparetor(dynamic object){

  }

  void enterRoom(String getRoomName,String getNickname) {

  }

}
