part of 'message_bloc.dart';

@immutable
abstract class MessageState {}

class MessageInitial extends MessageState {}

class MessageSuccessState extends MessageState {}

class InitialMessageState extends MessageState{

  InitialMessageState(this.initialMessage);

  final Map<String,dynamic> initialMessage;
}
class  ReceiveMessageState extends MessageState{

  ReceiveMessageState(this.initialMessage);

  final Map<String,dynamic> initialMessage;
}

class SendMessageState extends MessageState{

  SendMessageState(this.message);

  final Map<String,dynamic> message;
}

class ErrorRoomState extends MessageState{

  final String message;

  ErrorRoomState(this.message);
}