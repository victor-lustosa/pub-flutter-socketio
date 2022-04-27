part of 'room_bloc.dart';

@immutable
abstract class RoomEvent {}

class InitialEvent extends RoomEvent{
  InitialEvent();
}
class InitialRoomEvent extends RoomEvent{
  InitialRoomEvent();
}
class LoadingRoomsListEvent extends RoomEvent{
  // final double latitude;
  // final double longitude;
  // LoadingRoomsListEvent(this.latitude, this.longitude);
  LoadingRoomsListEvent();
}

class DisconnectEvent extends RoomEvent{
  DisconnectEvent();
}
class LeaveRoomEvent extends RoomEvent{
  LeaveRoomEvent();
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