import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pub/app/core/configs/app_colors.dart';
import 'package:pub/app/pages/room/models/data/enter_public_room_data.dart';
import 'package:pub/app/pages/user/models/user.dart';
import '../models/data/message_data.dart';
import '../bloc/message_bloc.dart';
import '../models/bloc_events.dart';
import '../models/room.dart';
abstract class IRoomViewModel{
  sendMessage(MessageBloc bloc);
  addParticipant(state, MessageBloc bloc);
}

class RoomViewModel extends ChangeNotifier implements IRoomViewModel{

  RoomViewModel({required this.room,required this.user});

  RoomViewModel.withoutInstance();

  List<dynamic> _participantsList = [];

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
  void addParticipant(state, MessageBloc bloc) {

    // if(boolAdd == true){
    // room.addMessages(state.message);
    if(state.message.getUser.getNickname != user.getNickname){
      addParticipants(state.message.getUser);
    } else{
      setParticipantsList(state.message.getUsersList);
    }
    notifyListeners();
    // boolAdd = false;
    bloc.add(DontBuildEvent());

    Timer(Duration(microseconds: 50), (){
      this.scrollController.jumpTo(
          this.scrollController.position.maxScrollExtent
      );
    });
  }
  void addMessage(state, MessageBloc bloc) {
    // if(boolAdd == true){
    room.addMessages(state.message);
    // boolAdd = false;
    bloc.add(DontBuildEvent());

    Timer(Duration(microseconds: 50), (){
      this.scrollController.jumpTo(
          this.scrollController.position.maxScrollExtent
      );
    });
  }

  typeMessage(state, index) {

    if(state.message.type != BlocEventType.user_enter_public_room || state.message.type != BlocEventType.broad_enter_public_room){
        return  Center(child: Text('${getParticipantsList[index].getTextMessage}'));
    } else{
      return Text('${room.getMessagesList[index].getUser} - ${room.getMessagesList[index].getTextMessage}');
    }
  }
  void addParticipants(dynamic initialMessageData) {
    _participantsList.add(initialMessageData.getUser);
  }
  get getParticipantsList => _participantsList;

  setParticipantsList(List<dynamic> participantsList) =>  _participantsList = participantsList;
}


