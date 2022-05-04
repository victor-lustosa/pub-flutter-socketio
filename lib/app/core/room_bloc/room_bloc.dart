import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:socket_io_client/socket_io_client.dart';
import '../../pages/participant/view_models/participant_view_model.dart';
import '../../pages/room/models/bloc_events.dart';
import '../../pages/room/models/data/data.dart';
import '../../pages/room/models/data/public_room_data.dart';
import '../../pages/room/models/data/message_data.dart';
import '../../pages/room/models/data/rooms_data.dart';
import '../../pages/room/view_models/room_view_model.dart';
import '../configs/app_routes.dart';

part 'room_event.dart';
part 'room_state.dart';

class RoomBloc extends Bloc<RoomEvent,RoomState>{

  late final Socket _socket;
  final RoomViewModel roomViewModel;
  late final ParticipantViewModel participantViewModel;

  RoomBloc({required this.roomViewModel}) : super(InitialState()) {

    _socket = io(urlServer, OptionBuilder().setTransports(['websocket']).build());
    _socket.connect();
    _socket.onConnect((_) {});
    _socket.on('public_message', (data) => add(ReceiveMessageEvent(data)));
    _socket.on('enter_public_room', (data) => add(ReceiveMessageEvent(data)));
    _socket.on('leave_public_room', (data) => add(ReceiveMessageEvent(data)));
    _socket.on('enter_private_room', (data) => add(ReceiveMessageEvent(data)));
    _socket.on('leave_private_room', (data) => add(ReceiveMessageEvent(data)));
    _socket.on('initial_rooms', (data) => add(ReceiveMessageEvent(data)));
    _socket.onDisconnect((_) => {});

    on<InitialRoomEvent>((event, emit) async{
      _socket.emit('enter_public_room', {
        'roomName': this.roomViewModel.getRoom.getRoomName,
        'idRoom': this.roomViewModel.getRoom.getIdRoom,
        'user': this.roomViewModel.getUser.toMap()
      });
      // emit(InitialRoomState());
    });

    on<LoadingRoomsEvent>((event, emit) async{
      _socket.emit('initial_rooms', {
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

    on<EnterPrivateRoomEvent>((event, emit) async{
      this.participantViewModel = event.participantViewModel;
      _socket.emit('enter_private_room', {
        'idRoom': this.roomViewModel.getRoom.getIdRoom,
        'idSender': this.roomViewModel.getUser.getIdUser,
        'idReceiver': this.participantViewModel.getParticipant.getIdUser
      });
    });
    on<SendPrivateMessageEvent>((event, emit) async{
      _socket.emit('private_message',{
        'message': event.message
      });
      emit(SendPrivateMessageState());
    });

    on<LeavePrivateRoomEvent>((event, emit) async{
      _socket.emit('leave_private_room', {
        'idRoom': this.roomViewModel.getRoom.getIdRoom,
        'idSender': this.roomViewModel.getUser.getIdUser,
        'idReceiver': this.participantViewModel.getParticipant.getIdUser
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
        case BlocEventType.update_rooms:
          return emit(SuccessRoomsState(message:RoomsData.fromMap(event.message),roomViewModel: roomViewModel));
        case BlocEventType.enter_public_room:
          return emit(EnterPublicRoomMessageState(message:PublicRoomData.fromMap(event.message),roomViewModel: roomViewModel));
        case BlocEventType.leave_public_room:
          return emit(LeavePublicRoomMessageState(message:PublicRoomData.fromMap(event.message),roomViewModel: roomViewModel));
        case BlocEventType.receive_public_message:
          return emit(ReceivePublicMessageState(message:MessageData.fromMap(event.message),roomViewModel: roomViewModel));
          case BlocEventType.receive_private_message:
          return emit(ReceivePrivateMessageState(message:MessageData.fromMap(event.message),participantViewModel: participantViewModel));
        case BlocEventType.enter_private_room:
          return emit(EnterPrivateRoomMessageState());
        case BlocEventType.leave_private_room:
          return emit(LeavePrivateRoomMessageState());
        case BlocEventType.typing:
          return emit(TypingMessageState());
        case BlocEventType.stopped_typing:
          return emit(StoppedTypingMessageState());
        case BlocEventType.delete_message:
          return emit(DeleteMessageState());
        case BlocEventType.edit_message:
          return emit(EditMessageState());
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


