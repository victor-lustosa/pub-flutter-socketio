import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:geolocator/geolocator.dart';

import '../../pages/room/models/bloc_events.dart';
import '../../pages/room/models/data/data.dart';
import '../../pages/room/models/data/enter_public_room_data.dart';
import '../../pages/room/models/data/leave_public_room_data.dart';
import '../../pages/room/models/data/message_data.dart';
import '../../pages/room/models/data/rooms_list_data.dart';
import '../../pages/room/models/room.dart';
import '../../pages/room/view_models/room_view_model.dart';
import '../../pages/user/models/user.dart';
import '../configs/app_routes.dart';

part 'room_event.dart';
part 'room_state.dart';

class RoomBloc extends Bloc<RoomEvent,RoomState>{

  late final Socket _socket;
  final RoomViewModel roomViewModel;

  RoomBloc({required this.roomViewModel}) : super(InitialState()) {

    _socket = io(urlServer, OptionBuilder().setTransports(['websocket']).build());
    _socket.connect();
    _socket.onConnect((_) {});
    _socket.on('public_message', (data) => add(ReceiveMessageEvent(data)));
    _socket.on('enter_public_room', (data) => add(ReceiveMessageEvent(data)));
    _socket.on('leave_public_room', (data) => add(ReceiveMessageEvent(data)));
    _socket.on('initial_rooms_list', (data) => add(ReceiveMessageEvent(data)));
    _socket.onDisconnect((data) => add(ReceiveMessageEvent(data)));

    on<InitialRoomEvent>((event, emit) async{
      _socket.emit('enter_public_room', {
        'roomName': this.roomViewModel.getRoom.getRoomName,
        'idRoom': this.roomViewModel.getRoom.getIdRoom,
        'user': this.roomViewModel.getUser.toMap()
      });
      emit(InitialRoomState());
    });

    on<LoadingRoomsListEvent>((event, emit) async{
      _socket.emit('initial_rooms_list', {
        'latitude': roomViewModel.getUser.getLatitude,
        'longitude': roomViewModel.getUser.getLongitude
      });
    });

    on<SendMessageEvent>((event, emit) async{
      _socket.emit('public_message',{
        'message': event.message
      });
      emit(SendMessageState());
    });

    on<LeaveRoomEvent>((event, emit) async{
      _socket.emit('leave_public_room', {
        'roomName': this.roomViewModel.getRoom.getRoomName,
        'idRoom': this.roomViewModel.getRoom.getIdRoom,
        'user': this.roomViewModel.getUser.toMap()
      });
    });

    on<DisconnectEvent>((event, emit) async{
      _socket.emit('disconnect_user', {
        'roomName': this.roomViewModel.getRoom.getRoomName,
        'idRoom': this.roomViewModel.getRoom.getIdRoom,
        'userNickName': this.roomViewModel.getUser.getNickname
      });
      _socket.disconnect();
    });

    on<ReceiveMessageEvent>((event, emit) async{

      Data data = Data.fromMap(event.message);

      switch(data.type){
        case BlocEventType.update_rooms_list:
          return emit(SuccessRoomsListState(message:RoomsListData.fromMap(event.message),roomViewModel: roomViewModel));
        case BlocEventType.enter_public_room:
          return emit(ReceiveEnterPublicRoomMessageState(message:EnterPublicRoomData.fromMap(event.message),roomViewModel: roomViewModel));
        case BlocEventType.leave_public_room:
          return emit(ReceiveLeavePublicRoomMessageState(message:LeavePublicRoomData.fromMap(event.message),roomViewModel: roomViewModel));
        case BlocEventType.typing:
          return emit(ReceiveTypingMessageState());
        case BlocEventType.stopped_typing:
          return emit(ReceiveStoppedTypingMessageState());
        case BlocEventType.receive_public_message:
          return emit(ReceiveMessageState(message:MessageData.fromMap(event.message),roomViewModel: roomViewModel));
        case BlocEventType.delete_message:
          return emit(ReceiveDeleteMessageState());
        case BlocEventType.edit_message:
          return emit(ReceiveEditMessageState());
        default:
          break;
      }});

    on<DontBuildEvent>((event, emit) async{
      emit(DontBuildState());
    });
  }
  @override
  Future<void> close() {
    _socket.clearListeners();
    _socket.close();
    return super.close();
  }
}


