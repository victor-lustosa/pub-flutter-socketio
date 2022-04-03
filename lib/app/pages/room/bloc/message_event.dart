part of 'message_bloc.dart';

@immutable
abstract class MessageEvent {}
class InitialEvent extends MessageEvent{}

class InitialMessageEvent extends MessageEvent{

  InitialMessageEvent(this.initialMessage);

  final Map<String,dynamic> initialMessage;
}
class  ReceiveMessageEvent extends MessageEvent{

  ReceiveMessageEvent(this.initialMessage);

  final Map<String,dynamic> initialMessage;
}

class SendMessageEvent extends MessageEvent{

  SendMessageEvent(this.message);

  final Map<String,dynamic> message;
}

class ErrorMessageEvent extends MessageEvent{

  final String message;

  ErrorMessageEvent(this.message);
}