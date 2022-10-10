import 'package:flutter/material.dart';
import 'package:pub/app/core/configs/app_colors.dart';
import 'package:pub/app/participant/models/participant.dart';
import 'package:pub/app/user/models/user.dart';

import '../../room/blocs/room_bloc.dart';
import '../../room/models/bloc_events.dart';
import '../../room/models/data/message_data.dart';

abstract class IParticipantViewModel {
  sendMessage(RoomBloc bloc);
}

class ParticipantViewModel extends ChangeNotifier
    implements IParticipantViewModel {
  ParticipantViewModel({required User user, required Participant participant})
      : _user = user,
        _participant = participant;

  final focusNode = FocusNode();
  final textController = TextEditingController(text: '');
  // late bool boolAdd;
  String error = '';
  User _user;
  int lineNumbers = 1;
  // bool isVisibled = false;
  Participant _participant;

  sendMessage(RoomBloc bloc) {
    String textMessage = textController.text;

    if (textMessage.isNotEmpty) {
      var mes = MessageData(
          idRoom: '',
          createdAt: DateTime.now().toString(),
          roomName: '',
          idMessage: '',
          textMessage: textMessage,
          user: this.getUser,
          code: 0,
          type: BlocEventType.send_private_message);

      _participant.getMessages.add(mes);

      bloc.add(SendPrivateMessageEvent(mes.toMap()));
      focusNode.requestFocus();
      textController.clear();
      focusNode.requestFocus();
    }
  }

  void dispose() {
    super.dispose();
    textController.dispose();
    focusNode.dispose();
  }

  Alignment alignment(state, index) {
    if (state is SendMessageState || state is ReceivePublicMessageState) {
      if (_participant.getMessages[index].getUser.getNickname !=
          _user.getNickname) {
        return Alignment.centerLeft;
      } else {
        return Alignment.centerRight;
      }
    } else {
      return Alignment.center;
    }
  }

  Color color(state, index) {
    if (state is SendMessageState || state is ReceivePublicMessageState) {
      if (_participant.getMessages[index].getUser.getNickname !=
          _user.getNickname) {
        return Colors.white;
      } else {
        return Color(0xffdcd9d9);
      }
    } else {
      return AppColors.lightBrown;
    }
  }

  typeMessage(state, index) {
    // Timer(Duration(microseconds: 50), (){
    //   this.scrollViewController.jumpTo(
    //       this.scrollViewController.position.maxScrollExtent
    //   );
    // });
    if (state is SendMessageState || state is ReceivePublicMessageState) {
      return Text(
          '${_participant.getMessages[index].getUser.getNickname} - ${_participant.getMessages[index].getTextMessage}');
    } else if (state is EnterPublicRoomMessageState) {
      return Center(
          child: Text('${state.message.getUser.getNickName} entrou na sala'));
    }
  }

  get getUser => _user;
  get getParticipant => _participant;

  setParticipant(Participant participant) => _participant = participant;
  setUser(User user) => _user = user;

  void addMessages(MessageData message) {
    getParticipant.addMessages(message);
  }

  // reload(RoomBloc bloc) {
  //   widget.bloc.add(LoadingRoomsEvent());
  // }
}
