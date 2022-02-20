
import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:pub/app/models/message.dart';
import 'package:pub/app/models/user.dart';
import 'package:pub/app/shared/config/app_routes.dart';
// import 'package:rx_notifier/rx_notifier.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../models/room.dart';


abstract class IRoomViewModel{
  // sendMessage();
}

class RoomViewModel implements IRoomViewModel{

  final _socketResponse = StreamController<Room>.broadcast();
  late final Socket socket;
  final Random randomNumber = new Random();
  final Room room;
  final User user;
  final focusNode = FocusNode();
  final Message message = Message.withoutParameters();

  Stream<Room> get getResponse => _socketResponse.stream;
  List<dynamic> dataMessagesList = [];
  // final listEvents = RxList<Room>([]);
  RoomViewModel(this.room, this.user){
    _initClientServer();
  }

  _initClientServer(){
    // Dart client
    socket = io(urlServer, OptionBuilder().setTransports(['websocket']).build());
    socket.connect();
    socket.onConnect((_){
      socket.emit('enter_room',{'room':this.room.getRoomName,'nickName':this.user.getNickname});
    });
    socket.on('message',(data){
      final event = Room.fromJson(data);
      _socketResponse.sink.add(event);
    });
  }


  final textController = TextEditingController(text: '');
  sizeBoxMessage(String value){
    if(value.length < 30) {
      return 1;
    } else if(value.length < 60){
      return 2;
    } else if(value.length < 100){
      return 3;
    } else{
      return 5;
    }
  }

  void sendMessage() {
    String textMessage = textController.text;
    message.setTextMessage(textMessage);
    if (textMessage.isNotEmpty) {
      this.user.setIdUser(randomNumber.nextInt(100));
      for(int i = 0;i < room.getUsersList.length; i++){
        if(room.getUsersList[i].getNickname != this.user.getNickname){
          room.addUsers(this.user);
        }
      }

      // room.setMessagesList([]);
      room.addMessages(
          Message(
              createdAt: DateTime.now().toString(),
              idMessage: randomNumber.nextInt(100),
              textMessage: textMessage,
              user: this.user.getNickname)
      );
      List jsonCodeUsersList = [];
      List jsonCodeMessagesList = [];
      print('oiii  ${room.getUsersList.toString()}');
      for(int i = 0; i < room.getUsersList.length; i++){
        jsonCodeUsersList.add(room.getUsersList[i].toMap());
        print('lista usuarios: ${jsonCodeUsersList[i]}');
      }

      for(int i = 0; i < room.getMessagesList.length; i++){
        jsonCodeMessagesList.add(room.getMessagesList[i].toMap());
        print('lista mensagens: ${jsonCodeMessagesList[i]}');
      }

      final event = Room(
          idRoom:randomNumber.nextInt(100),
          roomName:room.getRoomName,
          userNickName: user.getNickname,
          isPublic: true,
          usersList: jsonCodeUsersList,
          messagesList: jsonCodeMessagesList,
          type: 'message');

      socket.emit('message', event.toMap());
      _socketResponse.sink.add(event);
      textController.clear();
      focusNode.requestFocus();
    }
  }
  void dispose(){
    _socketResponse.close();
    socket.clearListeners();
    socket.dispose();
    textController.dispose();
    focusNode.dispose();
  }

  initialData() {

  }

  getData() {

  }

}