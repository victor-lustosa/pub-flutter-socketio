
import 'package:pub/app/models/data/initial_message_data.dart';
import 'package:pub/app/models/data/send_message_data.dart';

abstract class RoomState{

}
class InicialRoomState extends RoomState{

}

class SuccessInitialRoomState extends RoomState{

  SuccessInitialRoomState(this.initialMessage);

  final InitialMessageData initialMessage;

}

class NewMessageState extends RoomState{

  NewMessageState(this.message);

  final SendMessageData message;

}

class ErrorRoomState extends RoomState{

  final String message;

  ErrorRoomState(this.message);
}

class LoadingRoomState extends RoomState{}