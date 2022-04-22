part of 'room_bloc.dart';

@immutable
abstract class RoomEvent {}

class InitialEvent extends RoomEvent{
  InitialEvent();
}

class InitialRoomsListEvent extends RoomEvent{
  final String latitude;
  final String longitude;
  InitialRoomsListEvent(this.latitude, this.longitude);
}

class DisconnectEvent extends RoomEvent{
  DisconnectEvent();
}

class DontBuildEvent extends RoomEvent{
  DontBuildEvent();
}

class SendMessageEvent extends RoomEvent{
  final Map<String,dynamic> message;
  SendMessageEvent(this.message);
}

class SendingMessageEvent extends RoomEvent{
  SendingMessageEvent();
}

class ReceiveMessageEvent extends RoomEvent{
  final Map<String,dynamic> message;
  ReceiveMessageEvent(this.message);
}

class ErrorMessageEvent extends RoomEvent{
  ErrorMessageEvent();
}