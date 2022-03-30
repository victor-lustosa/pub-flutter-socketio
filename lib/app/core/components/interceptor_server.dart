import 'dart:async';
import 'package:pub/app/pages/room/states/room_state.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:flutter/material.dart';
import '../config/app_routes.dart';
import '../models/data/data.dart';
import '../models/data/enter_public_room_data.dart';
import '../models/data/initial_message_data.dart';
import '../models/data/send_message_data.dart';

class InterceptorServer extends ValueNotifier <RoomState> {
  InterceptorServer() : super(InicialRoomState());

  final focusNode = FocusNode();
  late final Socket socket;

  final ScrollController scrollController = ScrollController();
  final _socketResponse = StreamController<Map<String,dynamic>>.broadcast();

  Stream<Map<String,dynamic>> get getResponse => _socketResponse.stream;

  initClientServer(String getRoomName, String getNickname){
    // Dart client
    socket = io(urlServer, OptionBuilder().setTransports(['websocket']).build());
    socket.connect();
    socket.onConnect((_){
      socket.emit('enter_public_room',
          EnterPublicRoomData(roomName: getRoomName,userNickName: getNickname,type: 'enter_public_room').toMap());
    });

  }

  void sendMessage(String textMessage,String getNickname) {
    var mes = SendMessageData(
        createdAt: DateTime.now().toString(),
        idMessage: 0,
        textMessage: textMessage,
        user: getNickname,
        code:44,
        type: "message").toMap();

    socket.emit('message', mes);
    _socketResponse.sink.add(mes);
    notifyListeners();
  }
  dispose(){
    super.dispose();
    _socketResponse.close();
    socket.clearListeners();
    socket.dispose();
  }
  // socket.on('initial_message',(data){
  //   final event = InitialMessageData.fromMap(data);
  //   _socketResponse.sink.add(event);
  //   notifyListeners();
  // });
  Future getData() async {
    AsyncSnapshot response = getResponse as AsyncSnapshot;
    Data data = Data.fromMap(response.data);
    switch(data.type){
      case 'enter_public_room':
        var event = InitialMessageData.fromMap(response.data);
        SuccessInitialRoomState(event);
        _socketResponse.sink.add(event.toMap());
        notifyListeners();
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
    notifyListeners();
    Timer(Duration(microseconds: 100 ), (){
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
  }

  static dynamic comparetor(dynamic object){

  }

  void enterRoom(String getRoomName,String getNickname) {

  }
}
    // try{
    //
    //
    //
    //   value = SuccessInitialRoomState(products);
    //
    // } catch(e) {
    //
    //   value = ErrorProductState(e.toString());
    //
    // }
    // SuccessRoomState(Message.fromMap(snapshot.data!.getMessage));
