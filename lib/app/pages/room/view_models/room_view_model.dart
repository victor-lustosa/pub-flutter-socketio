
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pub/app/pages/user/models/user.dart';
import 'package:socket_io_client/socket_io_client.dart';
import '../../../core/configs/app_routes.dart';
import '../../../core/models/data/data.dart';
import '../../../core/models/data/enter_public_room_data.dart';
import '../../../core/models/data/initial_message_data.dart';
import '../../../core/models/data/send_message_data.dart';
import '../bloc/message_bloc.dart';
import '../models/room.dart';

abstract class IRoomViewModel{
  // sendMessage();
}

class RoomViewModel implements IRoomViewModel{

  RoomViewModel({required this.room,required this.user,required this.bloc}) {
    initClientServer();
  }
  RoomViewModel.withoutInstance();

  late final MessageBloc bloc;
  late final focusNode = FocusNode();
  List<dynamic> _usersList = [];
  List<dynamic> _messagesList = [];
  late final Room room;
  late final User user;
  int lineNumbers = 1;

  final textController = TextEditingController(text: '');
  late final Socket socket;
  final ScrollController scrollController = ScrollController();

  initClientServer(){
    socket = io(urlServer, OptionBuilder().setTransports(['websocket']).build());
    socket.connect();
    socket.onConnect((_){
      socket.emit('enter_public_room',
          EnterPublicRoomData(roomName: room.getRoomName,userNickName: user.getNickname,type: 'enter_public_room').toMap());

      socket.on('message',(data){
        final event = InitialMessageData.fromMap(data);
        bloc.inputMessage.add(SendMessageEvent(event.toMap()));
      });
    });
  }

  void sendMessage() {

    String textMessage = textController.text;
    if (textMessage.isNotEmpty) {
      var mes = SendMessageData(
          createdAt: DateTime.now().toString(),
          idMessage: 0,
          textMessage: textMessage,
          user: this.user.getNickname,
          code:44,
          type: "message");

      socket.emit('message', mes.toMap());
      // ReceiveMessageState(mes);
      bloc.inputMessage.add(SendMessageEvent(mes.toMap()));
      focusNode.requestFocus();
      textController.clear();
      focusNode.requestFocus();
    }
  }

  dispose(){
    socket.clearListeners();
    socket.dispose();
    focusNode.dispose();
    textController.dispose();
    scrollController.dispose();
  }
  // socket.on('initial_message',(data){
  //   final event = InitialMessageData.fromMap(data);
  //   _socketResponse.sink.add(event);
  //   notifyListeners();
  // });
  getData(AsyncSnapshot snapshot) async {

    Data data = Data.fromMap(snapshot.data);
    switch(data.type){
      case 'enter_public_room':
        var event = InitialMessageData.fromMap(snapshot.data);
        bloc.inputMessage.add(SendMessageEvent(event.toMap()));
        return Container();
        break;
    // case 'initial_message':
    // case 'initial_message':
    // case 'initial_message':
    // case 'initial_message':
    // case 'initial_message':
    // case 'initial_message':
      default:
        print("oi");
        break;
    }

    Timer(Duration(microseconds: 100 ), (){
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
  }

  get getUsersList => _usersList;

  set usersList(List<dynamic> value) {
    _usersList = value;
  }
  get getMessagesList => _messagesList;
  addMessage(Data initialMessageData) {
    _messagesList.add(initialMessageData);
  }
}
