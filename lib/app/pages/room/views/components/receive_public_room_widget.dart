import 'package:flutter/material.dart';
import 'package:pub/app/core/models/data/enter_public_room_data.dart';

class ReceiveEnterPublicRoomWidget extends StatelessWidget {
  ReceiveEnterPublicRoomWidget( this.message);

  final  EnterPublicRoomData message;

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text('${message.userNickName} entrou na sala'));
  }
}
