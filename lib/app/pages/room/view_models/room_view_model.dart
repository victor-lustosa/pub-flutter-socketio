import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pub/app/pages/user/models/user.dart';
import '../../../core/models/data/send_message_data.dart';
import '../bloc/message_bloc.dart';
import '../models/bloc_events.dart';
import '../models/room.dart';
abstract class IRoomViewModel{

  sendMessage(MessageBloc bloc);

  addMessage(state, MessageBloc bloc);

}

class RoomViewModel implements IRoomViewModel{

  RoomViewModel({required this.room,required this.user});

  RoomViewModel.withoutInstance();
  final ScrollController scrollController = ScrollController();
  final focusNode = FocusNode();
  final textController = TextEditingController(text: '');
  // late bool boolAdd;
  late final Room room;
  late final User user;
  int lineNumbers = 1;
  //     // _messagesList.add(event.getMessage);

  sendMessage(MessageBloc bloc){
    String textMessage = textController.text;
    if (textMessage.isNotEmpty) {
      var mes = SendMessageData(
          createdAt: DateTime.now().toString(),
          idMessage: 0,
          textMessage: textMessage,
          user: this.user.getNickname,
          code:44,
          type: BlocEventType.send_message);

      room.getMessagesList.add(mes);

      bloc.add(SendMessageEvent(mes.toMap()));
      focusNode.requestFocus();
      textController.clear();
      focusNode.requestFocus();
    }
  }
    // socket.on('initial_message',(data){
    //   final event = InitialMessageData.fromMap(data);
    //   _socketResponse.sink.add(event);
    //   notifyListeners();
    // });
  void dispose() {
    textController.dispose();
    focusNode.dispose();
    scrollController.dispose();
  }

  void addMessage(state, MessageBloc bloc) {
    // if(boolAdd == true){
    if(state is ReceiveMessageState){
      room.getMessagesList.add(state.message);
      // boolAdd = false;
      bloc.add(DontBuildEvent());
    }
    Timer(Duration(microseconds: 100), (){
      this.scrollController.jumpTo(
          this.scrollController.position.maxScrollExtent
      );
    });
  }
}


