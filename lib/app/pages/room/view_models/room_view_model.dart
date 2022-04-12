import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pub/app/core/configs/app_colors.dart';
import 'package:pub/app/pages/user/models/user.dart';
import '../../../core/models/data/message_data.dart';
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
  bool isVisibled = false;
  sendMessage(MessageBloc bloc){
    String textMessage = textController.text;
    if (textMessage.isNotEmpty) {
      var mes = MessageData(
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

  void dispose() {
    textController.dispose();
    focusNode.dispose();
    scrollController.dispose();
  }
  Alignment alignment(index){
    if(room.getMessagesList[index].getUser != ''){
      if(room.getMessagesList[index].getUser != user.getNickname){
        return  Alignment.centerLeft;
      } else{
        return Alignment.centerRight;
      }
    } else{
      return Alignment.center;
    }
  }
  Color color(index){
    if(room.getMessagesList[index].getUser != ''){
      if(room.getMessagesList[index].getUser != user.getNickname){
        return  Colors.white;
      } else{
        return Color(0xffdcd9d9);
      }
    } else {
      return AppColors.lightBrown;
    }
  }
  void addMessage(state, MessageBloc bloc) {
    // if(boolAdd == true){
    room.getMessagesList.add(state.message);
    // boolAdd = false;
    bloc.add(DontBuildEvent());

    Timer(Duration(microseconds: 100), (){
      this.scrollController.jumpTo(
          this.scrollController.position.maxScrollExtent
      );
    });
  }
}


