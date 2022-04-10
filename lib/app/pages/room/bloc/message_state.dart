part of 'message_bloc.dart';

@immutable
abstract class MessageState <T>{
  final T message;
  MessageState(this.message);
}

class InitialState extends MessageState{
  InitialState() : super(null);
}
class EnterPublicRoomState extends MessageState{
  EnterPublicRoomState(EnterPublicRoomData message) : super(message);
}
class DontBuildState extends MessageState{
  DontBuildState() : super(null);
}

class ReceiveTypingMessageState extends MessageState{
  ReceiveTypingMessageState(TypingData message) : super(message);
}

class ReceiveStoppedTypingMessageState extends MessageState{
  ReceiveStoppedTypingMessageState(StoppedTypingData message) : super(message);
}

class ReceiveMessageState extends MessageState{
  ReceiveMessageState(MessageData message): super(message);
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
