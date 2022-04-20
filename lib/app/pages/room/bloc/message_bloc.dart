import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:socket_io_client/socket_io_client.dart';
import '../../../core/configs/app_routes.dart';

import '../models/data/data.dart';
import '../models/data/delete_message_data.dart';
import '../models/data/edit_message_data.dart';
import '../models/data/enter_public_room_data.dart';
import '../models/data/leave_public_room_data.dart';
import '../models/data/message_data.dart';
import '../models/data/stopped_typing_data.dart';
import '../models/data/typing_data.dart';
import '../../user/models/user.dart';
import '../models/bloc_events.dart';
import '../models/room.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent,MessageState>{
  late final Socket _socket;
  late final Room room;
  late final User user;

  MessageBloc({required this.room,required this.user}) : super(InitialState()) {
    _socket = io(urlServer, OptionBuilder().setTransports(['websocket']).build());
    _socket.connect();

    _socket.on('public_message_data', (data) => add(ReceiveMessageEvent(data)));
    _socket.on('broad_enter_public_room', (data) => add(ReceiveMessageEvent(data)));
    _socket.on('user_enter_public_room', (data) => add(ReceiveMessageEvent(data)));
    _socket.on('leave_public_room', (data) => add(ReceiveMessageEvent(data)));

    on<InitialEvent>((event, emit) async{
      _socket.emit('enter_public_room', {
        'roomName': this.room.getRoomName,
        'user': this.user.toMap()
      });
      _socket.onConnect((_) {
      });
    });

    on<SendMessageEvent>((event, emit) async{
      _socket.emit('public_message',event.message);
      emit(SendMessageState());
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
          return emit(ReceiveEnterPublicRoomMessageState(message:EnterPublicRoomData.fromMap(event.message)));
        case BlocEventType.user_enter_public_room:
          return emit(ReceiveEnterPublicRoomMessageState(message:EnterPublicRoomData.fromMap(event.message)));
        case BlocEventType.leave_public_room:
          return emit(ReceiveLeavePublicRoomMessageState(LeavePublicRoomData.fromMap(event.message)));
        case BlocEventType.typing:
          return emit(ReceiveTypingMessageState(TypingData.fromMap(event.message)));
        case BlocEventType.stopped_typing:
          return emit(ReceiveStoppedTypingMessageState(StoppedTypingData.fromMap(event.message)));
        case BlocEventType.receive_public_message:
          return emit(ReceiveMessageState(MessageData.fromMap(event.message)));
        case BlocEventType.delete_message:
          return emit(ReceiveDeleteMessageState(DeleteMessageData.fromMap(event.message)));
        case BlocEventType.edit_message:
          return emit(ReceiveEditMessageState(EditMessageData.fromMap(event.message)));
        default:
          break;
      }
    }
    );
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


