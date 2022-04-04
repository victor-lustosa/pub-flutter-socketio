part of 'message_bloc.dart';

@immutable
abstract class MessageState {

  late final List<Data> messages;

  MessageState(this.messages);
}

class MessageInitial extends MessageState {
  MessageInitial(List<Data> messages) : super(messages);
}

class InitialMessageState extends MessageState{

  InitialMessageState(List<Data> messages) : super([]);

}


class ReceiveMessageState extends MessageState{

  ReceiveMessageState(List<Data> messages) : super(messages);


}

class ErrorRoomState extends MessageState{

  final String message;

  ErrorRoomState(this.message) : super([]);
}