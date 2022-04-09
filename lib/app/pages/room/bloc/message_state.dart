part of 'message_bloc.dart';

@immutable
abstract class MessageState <T>{
  final T message;

  MessageState(this.message);
}

class InitialMessageState extends MessageState{
  InitialMessageState() : super(null);
}

class DontBuildState extends MessageState{
  DontBuildState() : super(null);
}

class ReceiveInitialMessageState extends MessageState{

  ReceiveInitialMessageState(InitialMessageData message) : super(message);
}

class ReceiveTypingMessageState extends MessageState{

  ReceiveTypingMessageState(TypingData message) : super(message);
}

class ReceiveStoppedTypingMessageState extends MessageState{

  ReceiveStoppedTypingMessageState(StoppedTypingData message) : super(message);
}

class ReceiveMessageState extends MessageState{

  ReceiveMessageState(SendMessageData message): super(message);
}

class SendMessageState extends MessageState{

  SendMessageState(): super(null);
}
class SendingMessageState extends MessageState{

  SendingMessageState(): super(null);
}

class ReceiveEditMessageState extends MessageState{

  ReceiveEditMessageState(EditMessageData message): super(message);
}

class ReceiveDeleteMessageState extends MessageState{

  ReceiveDeleteMessageState(DeleteMessageData message): super(message);
}

class ReceiveEnterPublicRoomMessageState extends MessageState{

  ReceiveEnterPublicRoomMessageState({required EnterPublicRoomData message}): super(message);
}

class ReceiveLeavePublicRoomMessageState extends MessageState{
  ReceiveLeavePublicRoomMessageState(LeavePublicRoomData message): super(message);
}

// class ErrorRoomState extends MessageState{
//   final String message;
//   ErrorRoomState(this.message);
// }
