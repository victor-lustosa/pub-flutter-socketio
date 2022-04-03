import 'dart:async';

import 'package:meta/meta.dart';
import 'package:pub/app/pages/room/view_models/room_view_model.dart';

import '../../../core/models/data/initial_message_data.dart';
import '../../../core/models/data/send_message_data.dart';

part 'message_event.dart';
part 'message_state.dart';


class MessageBloc{

  final RoomViewModel _roomViewModel;

  MessageBloc(this._roomViewModel){

    _inputMessageController.stream.listen(_mapEventToState);

  }

  final StreamController<MessageEvent> _inputMessageController = StreamController<MessageEvent>();
  final StreamController<MessageState> _outputMessageController = StreamController<MessageState>();
  final StreamController<Map<String,dynamic>> _socketResponse  = StreamController<Map<String,dynamic>>.broadcast();

  Sink<MessageEvent> get inputMessage => _inputMessageController.sink;
  Stream<Map<String,dynamic>> get stream => _socketResponse.stream;
  Stream<Map<String,dynamic>> get server => _socketResponse.stream;

  _mapEventToState(MessageEvent event){

    if(event is InitialMessageEvent){

      print('initial data: '+ InitialMessageData.fromMap(event.initialMessage).toString());

    } else if(event is SendMessageEvent){

      _roomViewModel.addMessage(SendMessageData.fromMap(event.message));

    } else if(event is ReceiveMessageEvent){

      _roomViewModel.addMessage(SendMessageData.fromMap(event.initialMessage));

    }

  }


  dispose(){
    _inputMessageController.close();
    _socketResponse.close();
  }

}
// on<InitialMessageEvent>((event, emit) {
//   ((event,emit) => emit(InitialMessageState(event)));
// });
// on<ReceiveMessageEvent>((event, emit) {
//   ((event,emit) => emit(SendMessageState(event)));
// });
// on<SendMessageEvent>((event, emit) {
//   ((event,emit) => emit(SendMessageState(event)));
// });
// on<ErrorMessageEvent>((event, emit) {
//
// });
// final validateOrder =
// StreamTransformer<Map<String,dynamic>,Map<String,dynamic>>.fromHandlers(handleData: (order, sink) {
//   if (_pizzaList[order] != null) {
//     //pizza is available
//     if (_pizzaList[order] != 0) {
//       //pizza can be delivered
//       sink.add(_pizzaImages[order]);
//       final quantity = _pizzaList[order];
//       _pizzaList[order] = quantity-1;
//     } else {
//       //out of stock
//       sink.addError("Out of stock");
//     }
//   } else {
//     //pizza is not in the menu
//     sink.addError("Pizza not found");
//   }
// });