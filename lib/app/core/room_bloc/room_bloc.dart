import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../../pages/establishment/view_models/establishment_view_model.dart';
import '../../pages/room/models/bloc_events.dart';
import '../../pages/room/models/data/data.dart';
import '../../pages/room/models/data/enter_public_room_data.dart';
import '../../pages/room/models/data/initial_rooms_list_data.dart';
import '../../pages/room/models/data/leave_public_room_data.dart';
import '../../pages/room/models/data/message_data.dart';
import '../../pages/room/models/room.dart';
import '../../pages/room/view_models/room_view_model.dart';
import '../../pages/user/models/user.dart';
import '../configs/app_routes.dart';

part 'room_event.dart';
part 'room_state.dart';

class RoomBloc extends Bloc<RoomEvent,RoomState>{
  late final Socket _socket;
  late final Room room;
  late final User user;
  final RoomViewModel instance;
  RoomBloc({required this.room,required this.user,required this.instance}) : super(InitialState(instance: instance)) {
    _socket = io(urlServer, OptionBuilder().setTransports(['websocket']).build());
    _socket.connect();

    _socket.on('public_message_data', (data) => add(ReceiveMessageEvent(data)));
    _socket.on('broad_enter_public_room', (data) => add(ReceiveMessageEvent(data)));
    _socket.on('user_enter_public_room', (data) => add(ReceiveMessageEvent(data)));
    _socket.on('leave_public_room', (data) => add(ReceiveMessageEvent(data)));
    _socket.on('leave_public_room', (data) => add(ReceiveMessageEvent(data)));

    on<InitialEvent>((event, emit) async{
      _socket.emit('enter_public_room', {
        'roomName': this.room.getRoomName,
        'user': this.user.toMap()
      });
      _socket.onConnect((_) {
      });
    });

    on<LoadingRoomsListEvent>((event, emit) async{
      _socket.emit('initial_rooms_list', {
        'latitude': event.latitude,
        'longitude': event.longitude
      });
      _socket.onConnect((_) {
      });
    });
    on<SendMessageEvent>((event, emit) async{
      _socket.emit('public_message',event.message);
      emit(SendMessageState(instance: instance));
    });

    on<DisconnectEvent>((event, emit) async{
      _socket.emit('leave_public_room', {
        'roomName': this.room.getRoomName,
        'userNickName': this.user.getNickname
      });
      _socket.onDisconnect((_) {
      });
    });

    on<ReceiveMessageEvent>((event, emit) async{

      Data data = Data.fromMap(event.message);

      switch(data.type){
        case BlocEventType.broad_enter_public_room:
          return emit(SuccessRoomsListState(message:InitialRoomsListData.fromMap(event.message),instance: EstablishmentViewModel()));
        case BlocEventType.broad_enter_public_room:
          return emit(ReceiveBroadEnterPublicRoomMessageState(message:EnterPublicRoomData.fromMap(event.message),instance: instance));
        case BlocEventType.user_enter_public_room:
          return emit(ReceiveUserEnterPublicRoomMessageState(message:EnterPublicRoomData.fromMap(event.message),instance: instance));
        case BlocEventType.leave_public_room:
          return emit(ReceiveLeavePublicRoomMessageState(message:LeavePublicRoomData.fromMap(event.message),instance: instance));
        case BlocEventType.typing:
          return emit(ReceiveTypingMessageState(instance: instance));
        case BlocEventType.stopped_typing:
          return emit(ReceiveStoppedTypingMessageState(instance: instance));
        case BlocEventType.receive_public_message:
          return emit(ReceiveMessageState(message:MessageData.fromMap(event.message),instance: instance));
        case BlocEventType.delete_message:
          return emit(ReceiveDeleteMessageState(instance: instance));
        case BlocEventType.edit_message:
          return emit(ReceiveEditMessageState(instance: instance));
        default:
          break;
      }
    }
    );
    on<DontBuildEvent>((event, emit) async{
      emit(DontBuildState(instance: instance));
    });
  }
  @override
  Future<void> close() {
    _socket.clearListeners();
    _socket.close();
    return super.close();
  }
}


