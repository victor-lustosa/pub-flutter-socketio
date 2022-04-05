part of 'message_bloc.dart';

@immutable
abstract class MessageState {
}

class InitialMessageState extends MessageState{
  InitialMessageState();
}
class ReceiveInitialMessageState extends MessageState{
  final InitialMessageData message;
  ReceiveInitialMessageState(this.message);
}
class ReceiveTypingMessageState extends MessageState{
  final TypingData message;
  ReceiveTypingMessageState(this.message);
}
class ReceiveStoppedTypingMessageState extends MessageState{
  final StoppedTypingData message;
  ReceiveStoppedTypingMessageState(this.message);
}
class ReceiveSendMessageState extends MessageState{
  final SendMessageData message;
  ReceiveSendMessageState(this.message);
}
class ReceiveEditMessageState extends MessageState{
  final EditMessageData message;
  ReceiveEditMessageState(this.message);
}
class ReceiveDeleteMessageState extends MessageState{
  final DeleteMessageData message;
  ReceiveDeleteMessageState(this.message);
}
class ReceiveEnterPublicRoomMessageState extends MessageState{
  final EnterPublicRoomData message;
  ReceiveEnterPublicRoomMessageState(this.message);
}
class ReceiveLeavePublicRoomMessageState extends MessageState{
  final LeavePublicRoomData message;
  ReceiveLeavePublicRoomMessageState(this.message);
}
class ErrorRoomState extends MessageState{
  final String message;
  ErrorRoomState(this.message);
}
