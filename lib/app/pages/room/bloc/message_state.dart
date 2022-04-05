part of 'message_bloc.dart';

@immutable
abstract class MessageState {
  late final List<SendMessageData> messages;
  MessageState(this.messages);
}

class MessageInitial extends MessageState {
  MessageInitial(List<SendMessageData> messages) : super(messages);
}

class InitialMessageState extends MessageState{
  InitialMessageState() : super([]);
}

class ReceiveMessageState extends MessageState{
  ReceiveMessageState(List<SendMessageData> messages) : super(messages);
}

class ErrorRoomState extends MessageState{
  final String message;
  ErrorRoomState(this.message) : super([]);
}