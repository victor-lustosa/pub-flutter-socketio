part of 'message_bloc.dart';

@immutable
abstract class MessageEvent {

}
class InitialEvent extends MessageEvent{

  InitialEvent();
}

class InitialMessageEvent extends MessageEvent{
  InitialMessageEvent();

}
class DontBuildEvent extends MessageEvent{
  DontBuildEvent();

}
class SendMessageEvent extends MessageEvent{

  final Map<String,dynamic> message;
  SendMessageEvent(this.message);
}

class ErrorMessageEvent extends MessageEvent{
  ErrorMessageEvent();

}