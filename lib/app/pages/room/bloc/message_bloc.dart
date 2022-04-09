import 'package:pub/app/pages/room/view_models/room_view_model.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../../../core/configs/app_routes.dart';
import '../../../core/models/data/enter_public_room_data.dart';
import '../../../core/models/data/initial_message_data.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:pub/app/core/models/data/enter_public_room_data.dart';
import 'package:pub/app/core/models/data/initial_message_data.dart';
import '../../../core/models/data/data.dart';
import '../../../core/models/data/delete_message_data.dart';
import '../../../core/models/data/edit_message_data.dart';
import '../../../core/models/data/leave_public_room_data.dart';
import '../../../core/models/data/send_message_data.dart';
import '../../../core/models/data/stopped_typing_data.dart';
import '../../../core/models/data/typing_data.dart';
import '../models/bloc_events.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent,MessageState>{
  final RoomViewModel roomViewModel;
  // socket.connect();
  // socket.onConnect((_){
  // socket.emit('enter_public_room',
  // EnterPublicRoomData(roomName: room.getRoomName,userNickName: user.getNickname,type: BlocEventType.enter_public_room).toMap());
  //
  // socket.on('message',(data){
  // bloc.add(ReceiveMessageEvent(data));
  // });
  // });
  MessageBloc({required this.roomViewModel}) : super(InitialMessageState()){

    on<SendMessageEvent>((event, emit) async{
      roomViewModel.socket.emit('message',event.message);
      emit(SendMessageState());
    });
    // on<SendingMessageEvent>((event, emit) async{
    //   emit(SendingMessageState());
    // });
    on<ReceiveMessageEvent>((event, emit) async{
      emit(ReceiveMessageState(SendMessageData.fromMap(event.message)));
    });
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
  @override
  Future<void> close() {
    return super.close();
  }
}
    // else if(event is DontBuildEvent) {
    //   dontBuild(event, emit);
    // }

    // ,transformer: sequential()

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


