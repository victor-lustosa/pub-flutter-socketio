
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pub/app/pages/user/models/user.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../../../core/configs/app_routes.dart';
import '../../../core/models/data/enter_public_room_data.dart';
import '../../../core/models/data/send_message_data.dart';
import '../bloc/message_bloc.dart';
import '../models/bloc_events.dart';
import '../models/room.dart';

abstract class IRoomViewModel{
  // sendMessage();
}

class RoomViewModel  implements IRoomViewModel{

  RoomViewModel({required this.room,required this.user}) {
    initClientServer();
  }
  RoomViewModel.withoutInstance();
  final ScrollController scrollController = ScrollController();
  final focusNode = FocusNode();
  final textController = TextEditingController(text: '');

  late final Room room;
  late final User user;
  int lineNumbers = 1;

  late final Socket socket;

  initClientServer(){
    socket = io(urlServer, OptionBuilder().setTransports(['websocket']).build());
    socket.connect();
    socket.onConnect((_){
      socket.emit('enter_public_room',
          EnterPublicRoomData(roomName: room.getRoomName,userNickName: user.getNickname,type: BlocEventType.enter_public_room).toMap());

      // socket.on('message',(data){
      //   final event = InitialMessageData.fromMap(data);
      //   bloc.add(SendMessageEvent(event.toMap()));
      // });
    });
  }
  sendMessage(MessageBloc read){
    String textMessage = textController.text;
    if (textMessage.isNotEmpty) {
      var mes = SendMessageData(
          createdAt: DateTime.now().toString(),
          idMessage: 0,
          textMessage: textMessage,
          user: this.user.getNickname,
          code:44,
          type: BlocEventType.send_message);

      socket.emit('message', mes.toMap());
      read.add(SendMessageEvent(mes.toMap()));
      focusNode.requestFocus();
      textController.clear();
      focusNode.requestFocus();
    }

    // socket.on('initial_message',(data){
    //   final event = InitialMessageData.fromMap(data);
    //   _socketResponse.sink.add(event);
    //   notifyListeners();
    // });



    // addMessage(List<SendMessageData> initialMessageData) {
    //   List<SendMessageData> list =  initialMessageData;
    //
    //   return list;
    // }
  }

  void dispose() {
    textController.dispose();
    focusNode.dispose();
    scrollController.dispose();
    socket.clearListeners();
    socket.dispose();
  }
}


