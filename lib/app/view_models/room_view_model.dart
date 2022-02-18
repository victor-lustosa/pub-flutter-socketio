
import 'package:flutter/cupertino.dart';
import 'package:pub/app/models/establishment.dart';
import 'package:pub/app/models/message.dart';
import 'package:pub/app/models/user.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:socket_io_client/socket_io_client.dart';
import '../models/room.dart';
import '../shared/components/stream_socket.dart';

abstract class IRoomViewModel{
  sendMessage();
}

class RoomViewModel implements IRoomViewModel{
  late Socket socket;
  Establishment establishment;
  final User user;
  final Message message = Message();
  final listEvents = RxList<Room>([]);
  RoomViewModel(this.establishment, this.user){
    this.establishment.setRoom(Room());
    this.establishment.getRoom.setName(this.establishment.getName);
    this.establishment.getRoom.setIdRoom(23);
    this.establishment.getRoom.setIcon('');
    this.establishment.getRoom.setPublic(true);
    this.establishment.getRoom.getListUsers().push(this.user);
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
      socket.emit('enter_room',{'room':this.establishment.getRoom,'name':this.user.getNickname});
    });
    socket.on('message',(data){
      final event = this.establishment.getRoom.fromJson(data);
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
    if (textMessage.isNotEmpty) {
      message.setTextMessage(textMessage);
      message.setUser(user);

      message.setRoom(this.establishment.getRoom.getName);
      this.establishment.getRoom.setMessage(message);
      socket.emit('message',this.establishment.getRoom.toMap());
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