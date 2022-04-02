


import '../../../core/models/data/data.dart';
import '../../../core/models/data/initial_message_data.dart';
import '../../../core/models/data/send_message_data.dart';

abstract class RoomState{

}
class InicialRoomState extends RoomState{

}

class InitialMessageState extends RoomState{

  InitialMessageState(this.initialMessage);

  final InitialMessageData initialMessage;

}
class  ReceiveMessageState extends RoomState{

  ReceiveMessageState(this.initialMessage);

  final Data initialMessage;

}

class SendMessageState extends RoomState{

  SendMessageState(this.message);

  final SendMessageData message;

}

class ErrorRoomState extends RoomState{

  final String message;

  ErrorRoomState(this.message);
}
