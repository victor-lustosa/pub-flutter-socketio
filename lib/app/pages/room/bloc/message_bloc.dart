
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import '../../../core/models/data/send_message_data.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent,MessageState>{

  MessageBloc() : super(InitialMessageState()){
    List<SendMessageData> listMessages = [];

    on<SendMessageEvent>((event, emit) {
      listMessages.add(SendMessageData.fromMap(event.message));
      emit(ReceiveMessageState(listMessages));
    });

    on<ErrorMessageEvent>((event, emit) {

    });
  }
}

// final StreamController<MessageEvent> _inputMessageController = StreamController<MessageEvent>();
// final StreamController<MessageState> _outputMessageController = StreamController<MessageState>();
// final StreamController<Map<String,dynamic>> _socketResponse  = StreamController<Map<String,dynamic>>.broadcast();
//
// Sink<MessageEvent> get inputMessage => _inputMessageController.sink;
// Stream<MessageState> get stream => _outputMessageController.stream;
// Stream<Map<String,dynamic>> get server => _socketResponse.stream;
//
// _mapEventToState(MessageEvent event){
//   List<Data> listMessages = [];
//   if(event is InitialMessageEvent){
//
//     print('initial data: ' + InitialMessageData.fromMap(event.initialMessage).toString());
//
//   } else if(event is SendMessageEvent) {
//     listMessages.add(SendMessageData.fromMap(event.message));
//     _outputMessageController.add(ReceiveMessageState(listMessages));
//
//   }
// }

// dispose(){
//   _outputMessageController.close();
//   _inputMessageController.close();
//   _socketResponse.close();
// }

