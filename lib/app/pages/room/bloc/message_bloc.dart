import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:pub/app/core/models/data/enter_public_room_data.dart';
import 'package:pub/app/core/models/data/initial_message_data.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../../../core/configs/app_routes.dart';
import '../../../core/models/data/delete_message_data.dart';
import '../../../core/models/data/edit_message_data.dart';
import '../../../core/models/data/enter_public_room_data.dart';
import '../../../core/models/data/initial_message_data.dart';
import '../../../core/models/data/leave_public_room_data.dart';
import '../../../core/models/data/send_message_data.dart';
import '../../../core/models/data/stopped_typing_data.dart';
import '../../../core/models/data/typing_data.dart';
import '../../user/models/user.dart';
import '../models/room.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent,MessageState>{
  late final Socket _socket;
  late final Room room;
  late final User user;

  MessageBloc({required this.room,required this.user}) : super(InitialMessageState()){

    _socket = io(urlServer, OptionBuilder().setTransports(['websocket']).build());
    _socket.connect();
    _socket.onConnect((_){
      _socket.emit('enter_public_room',{'roomName':this.room.getRoomName,'userNickName':this.user.getNickname});
    });

    _socket.on('message',(data) => add(ReceiveMessageEvent(data)));
    _socket.on('message',(data) => add(ReceiveMessageEvent(data)));
    _socket.on('message',(data) => add(ReceiveMessageEvent(data)));
    _socket.on('message',(data) => add(ReceiveMessageEvent(data)));
    _socket.on('message',(data) => add(ReceiveMessageEvent(data)));

    on<SendMessageEvent>((event, emit) async{
     _socket.emit('message',event.message);
      emit(SendMessageState());
    });

    on<ReceiveMessageEvent>((event, emit) async{
      emit(ReceiveMessageState(SendMessageData.fromMap(event.message)));
    });
    on<DontBuildEvent>((_, emit) async{
      emit(DontBuildState());
    });
  }

  @override
  Future<void> close() {
    _socket.close();
    return super.close();
  }
}
//
// eventToState(event, emit) async{
//   if(event is SendMessageEvent){
//
//   }
//   else if(event is ReceiveMessageEvent) {
//     // _socketResponse.sink.add(data);
//
//
// }}
    // else if(event is DontBuildEvent) {
    //   dontBuild(event, emit);
    // }

    // ,

    // async {

    // if(event is SendMessageEvent){
    //  (event, emit);
    // }
    // if(event is ReceiveMessageEvent){
    //   eventToState(event, emit);
    // }
    // else if(event is DontBuildEvent){
    //   dontBuild(event, emit);
    // }
    // }


// if(event is InitialMessageEvent)
//     case BlocEventType.enter_public_room:
//       yield ReceiveEnterPublicRoomMessageState(message:EnterPublicRoomData.fromMap( event.message));
//       break;
//     case BlocEventType.leave_public_room:
//
//       yield ReceiveLeavePublicRoomMessageState(LeavePublicRoomData.fromMap(event.message));
//       break;
//     case BlocEventType.typing:
//       yield ReceiveTypingMessageState(TypingData.fromMap(event.message));
//       break;
//     case BlocEventType.stopped_typing:
//       yield ReceiveStoppedTypingMessageState(StoppedTypingData.fromMap(event.message));
//       break;
//     case BlocEventType.send_message:

// else if(event is SendingMessageEvent){
//    yield SendMessageState();
//    _socket.emit('message',event.message);
//  }
//   break;
// case BlocEventType.receive_message:

//   break;
// case BlocEventType.delete_message:
//   yield ReceiveDeleteMessageState(DeleteMessageData.fromMap(event.message));
//   break;
// case BlocEventType.edit_message:
//   yield ReceiveEditMessageState(EditMessageData.fromMap(event.message));
//   break;
// default:
//   print("oi");
//   break;


//
// dontBuild(event, emit) async{
//   return emit(DontBuildState());
// }
// }


