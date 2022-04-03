import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pub/app/pages/room/bloc/message_bloc.dart';

import 'package:pub/app/pages/room/view_models/room_view_model.dart';

import '../../../core/models/data/data.dart';
import '../../../core/models/data/initial_message_data.dart';
import '../../../core/models/data/send_message_data.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc {

  late final RoomViewModel _roomViewModel;

  final StreamController<MessageEvent> _inputMessageController = StreamController<MessageEvent>();
  final StreamController<MessageState> _outputMessageController = StreamController<MessageState>();

  Sink<MessageEvent> get inputMessage => _inputMessageController.sink;
  Stream<Map<String, dynamic>> get stream => _roomViewModel.getResponse;

  MessageBloc(this._roomViewModel){

    _inputMessageController.stream.listen(_mapEventToState);

  }
  _mapEventToState(MessageEvent event){

    if(event is InitialMessageEvent){

      print('initial data: '+ InitialMessageData.fromMap(event.initialMessage).toString());

    } else if(event is SendMessageEvent){

      _roomViewModel.addMessage(SendMessageData.fromMap(event.message));

    } else if(event is ReceiveMessageEvent){

      _roomViewModel.addMessage(SendMessageData.fromMap(event.initialMessage));

    }
    _outputMessageController.add(MessageSuccessState());
  }

  dispose(){
    inputMessage.close();
  }
// class MessageBloc extends Bloc<MessageEvent, MessageState> {
  // MessageBloc(this._roomViewModel) : super(MessageInitial()) {
  //   on<MessageEvent>((event, emit) {
  //
  //   });
  // }
}
