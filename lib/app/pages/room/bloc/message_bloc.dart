
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

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent,MessageState>{

  MessageBloc() : super(InitialMessageState()){
    on<SendMessageEvent>((event, emit) {
      Data data = Data.fromMap(event.message);
      switch(data.type){
        case BlocEventType.enter_public_room:
          emit(ReceiveEnterPublicRoomMessageState(EnterPublicRoomData.fromMap(event.message)));
          break;
        case BlocEventType.leave_public_room:
          emit(ReceiveLeavePublicRoomMessageState(LeavePublicRoomData.fromMap(event.message)));
          break;
        case BlocEventType.typing:
          emit(ReceiveTypingMessageState(TypingData.fromMap(event.message)));
          break;
        case BlocEventType.stopped_typing:
          emit(ReceiveStoppedTypingMessageState(StoppedTypingData.fromMap(event.message)));
          break;
        case BlocEventType.send_message:
          emit(ReceiveSendMessageState(SendMessageData.fromMap(event.message)));
          break;
        case BlocEventType.delete_message:
          emit(ReceiveDeleteMessageState(DeleteMessageData.fromMap(event.message)));
          break;
        case BlocEventType.edit_message:
          emit(ReceiveEditMessageState(EditMessageData.fromMap(event.message)));
          break;
        default:
          print("oi");
          break;
      }
    });

    on<ErrorMessageEvent>((event, emit) {

    });
  }
}


