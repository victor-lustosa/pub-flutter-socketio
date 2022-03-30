
import 'package:flutter/cupertino.dart';
import 'package:pub/app/pages/user/models/user.dart';

// import 'package:rx_notifier/rx_notifier.dart';

import '../models/room.dart';
import '../../../core/components/interceptor_server.dart';

abstract class IRoomViewModel{
  // sendMessage();
}

class RoomViewModel implements IRoomViewModel{

  RoomViewModel(this.room,this.user, this.interceptor){
    interceptor.initClientServer(this.room.getRoomName,this.user.getNickname);
    // room.addUsers(this.user);
    // room.setMessage(new Message(user: '',textMessage: '',idMessage: 0,createdAt: ''));
    // room.setIcon('');
    // room.setUserNickName(this.user.getNickname);
    // room.setIsPublic(true);
  }

  late final InterceptorServer interceptor;
  List<dynamic> _usersList = [];
  List<dynamic> _messagesList = [];
  late final Room room;
  late final User user;
  final focusNode = FocusNode();
  int lineNumbers = 1;

  final textController = TextEditingController(text: '');

  dispose(){
    interceptor.dispose();
    textController.dispose();
    focusNode.dispose();
  }

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

}

// for(int i = 0; i < room.getUsersList.length; i++){
//   jsonCodeUsersList.add(room.getUsersList[i].toMap());
//   print('lista usuarios: ${jsonCodeUsersList[i]}');
// }
