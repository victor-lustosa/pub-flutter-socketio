part of 'message_bloc.dart';

@immutable
abstract class MessageState {}

class MessageInitial extends MessageState {}

class MessageSuccessState extends MessageState {}

class InitialMessageState extends MessageState{

  InitialMessageState(this.initialMessage);

  final InitialMessageData initialMessage;
}
class  ReceiveMessageState extends MessageState{

  ReceiveMessageState(this.initialMessage);

  final Data initialMessage;
}

class SendMessageState extends MessageState{

  SendMessageState(this.message);

  final SendMessageData message;
}

class ErrorRoomState extends MessageState{

  final String message;

  ErrorRoomState(this.message);
}