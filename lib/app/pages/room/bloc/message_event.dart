part of 'message_bloc.dart';

@immutable
abstract class MessageEvent {}

class InitialEvent extends MessageEvent{

  InitialEvent();
}
class DisconnectEvent extends MessageEvent{

  DisconnectEvent();
}
class DontBuildEvent extends MessageEvent{
  DontBuildEvent();
}
class SendMessageEvent extends MessageEvent{
  final Map<String,dynamic> message;
  SendMessageEvent(this.message);
}
class SendingMessageEvent extends MessageEvent{
  SendingMessageEvent();
}
class ReceiveMessageEvent extends MessageEvent{
  final Map<String,dynamic> message;
  ReceiveMessageEvent(this.message);
}
class ErrorMessageEvent extends MessageEvent{
  ErrorMessageEvent();
}