
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:pub/app/models/message.dart';
import 'package:pub/app/models/user.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../models/room.dart';

abstract class IRoomViewModel{
  // sendMessage();
}

class RoomViewModel implements IRoomViewModel{
  late final Socket socket;
  final Random randomNumber = new Random();
  final Room room;
  final User user;
  final Message message = Message.withoutParameters();
  final listEvents = RxList<Room>([]);
  RoomViewModel(this.room, this.user){
    _initClientServer();
  }

  _initClientServer(){
    // Dart client
    socket = io('http://localhost:4000',
        OptionBuilder().
        setTransports(['websocket']).
        build()
    );
    socket.connect();
    socket.onConnect((_){
      socket.emit('enter_room',{'room':this.room.getName,'name':this.user.getNickname});
    });
    socket.on('message',(data){
      print(data);
      final event = Room.fromJson(data);
      // listEvent.value.add(event);
      // listEvent.value = List.from(listEvent.value);
      listEvents.add(event);
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
    print(textMessage);
    print("entrei");
    message.setTextMessage(textMessage);
    if (textMessage.isNotEmpty) {
      this.user.setIdUser(randomNumber.nextInt(100));
      room.addUser(this.user);
      List userJsonCode = [];
      for(int i = 0; i < room.getListUsers.length; i++){
        userJsonCode.add(room.getListUsers[i].toMap());
      }
      final event = Room(
          idRoom:randomNumber.nextInt(100),
          name: room.getName,
          isPublic: true,
          listUsers: userJsonCode,
          message: Message(
              createdAt: DateTime.now().toString(),
              idMessage: randomNumber.nextInt(100),
              textMessage: textMessage,
              user: this.user.getNickname
          ),
          type: 'message');
      socket.emit('message', event.toMap());
      // StreamSocket.instance.addResponse(message);
      // StreamSocket.instance.toStringStream();
      textController.clear();
    }
  }
  void dispose(){
    socket.clearListeners();
    socket.dispose();
    textController.dispose();
    // focusNode.dispose();
  }
}