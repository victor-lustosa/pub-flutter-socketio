
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

  bool updateShouldNotify(InheritedWidget oldWidget) => true;
  MessageBloc() : super(InitialMessageState()){
    on<MessageEvent>((event, emit) {
      if(event is SendMessageEvent){
        eventToState(event, emit);
      }

      else if(event is DontBuildEvent) {
        dontBuild(event, emit);
      }
    },transformer: sequential()
    );
  }
  eventToState( event, Emitter<MessageState> emit) async{
    Data data = Data.fromMap(event.message);
    switch(data.type){
      case BlocEventType.enter_public_room:
        return emit(ReceiveEnterPublicRoomMessageState(EnterPublicRoomData.fromMap(event.message)));
      case BlocEventType.leave_public_room:
        return emit(ReceiveLeavePublicRoomMessageState(LeavePublicRoomData.fromMap(event.message)));
      case BlocEventType.typing:
        return emit(ReceiveTypingMessageState(TypingData.fromMap(event.message)));
      case BlocEventType.stopped_typing:
        return emit(ReceiveStoppedTypingMessageState(StoppedTypingData.fromMap(event.message)));
      case BlocEventType.send_message:
        return emit(ReceiveSendMessageState(SendMessageData.fromMap(event.message)));
      case BlocEventType.delete_message:
        return emit(ReceiveDeleteMessageState(DeleteMessageData.fromMap(event.message)));
      case BlocEventType.edit_message:
        return emit(ReceiveEditMessageState(EditMessageData.fromMap(event.message)));
      default:
        print("oi");
        break;
    }
  }
  dontBuild(event, emit) async{
    return emit(DontBuildState());
  }
}


