part of 'room_bloc.dart';

abstract class RoomState <T> {
  RoomState(this.message, this.roomViewModel);
  final T message;
  final T roomViewModel;
}
class InitialState extends RoomState{
  InitialState() : super(null, null);
}
class InitialRoomState extends RoomState{
  InitialRoomState() : super(null, null);
}
class LoadingRoomsState extends RoomState{
  LoadingRoomsState() : super(null, null);
}
class SuccessRoomsState extends RoomState{
  SuccessRoomsState({required RoomsData message,required RoomViewModel roomViewModel}) : super(message, roomViewModel){
    roomViewModel.fetchedRooms(message);
  }
}
class DontBuildState extends RoomState{
  DontBuildState() : super(null, null);
}

class EnterPublicRoomMessageState extends  RoomState{
  EnterPublicRoomMessageState({required PublicRoomData message, required RoomViewModel roomViewModel}) : super(message, roomViewModel){
    roomViewModel.addParticipants(message);
    if(message.getUser.getNickname != roomViewModel.getUser.getNickname)
      roomViewModel.addMessages(message);
  }
}
class LeavePublicRoomMessageState extends RoomState{
  LeavePublicRoomMessageState({required PublicRoomData message, required RoomViewModel roomViewModel}) : super(message, roomViewModel){
    roomViewModel.removeParticipants(message);
    if(message.getUser.getNickname != roomViewModel.getUser.getNickname)
      roomViewModel.addMessages(message);
  }
}
class ReceivePublicMessageState extends RoomState {
  ReceivePublicMessageState({required MessageData message, required RoomViewModel roomViewModel}) : super(message, roomViewModel){
    roomViewModel.addMessages(message);
  }
}
class ReceivePrivateMessageState extends RoomState {
  ReceivePrivateMessageState({required MessageData message, required ParticipantViewModel participantViewModel}) : super(message, participantViewModel){
    participantViewModel.addMessages(message);
  }
}

class TypingMessageState extends RoomState{
  TypingMessageState() : super(null, null);
}

class StoppedTypingMessageState extends RoomState{
  StoppedTypingMessageState() : super(null, null);
}

class SendMessageState extends RoomState{
  SendMessageState() : super(null, null);
}
class SendPrivateMessageState extends RoomState{
  SendPrivateMessageState() : super(null, null);
}

class SendingMessageState extends RoomState{
  SendingMessageState() : super(null, null);
}
class DisconnectState extends RoomState{
  DisconnectState() : super(null,null);
}

class EditMessageState extends RoomState{
  EditMessageState() : super(null, null);
}

class DeleteMessageState extends RoomState{
  DeleteMessageState() : super(null, null);
}

