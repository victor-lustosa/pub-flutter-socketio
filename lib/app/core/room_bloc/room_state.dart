part of 'room_bloc.dart';

@immutable
abstract class RoomState <T> {
  RoomState(this.message, this.roomViewModel);
  final T message;
  final T roomViewModel;
}

class InitialState extends RoomState{
  InitialState({required RoomViewModel roomViewModel}) : super(null, roomViewModel);
}
class LoadingRoomsListState extends RoomState{
  LoadingRoomsListState({required RoomViewModel roomViewModel}) : super(null, roomViewModel);
}
class SuccessRoomsListState extends RoomState{
  fetchedRoomsList(){
    for(dynamic roomData in message.getRoomsList){
      roomViewModel.addRoom(Room.fromMinimalMap(roomData));
    }
  }
  SuccessRoomsListState({required RoomsListData message,required RoomViewModel roomViewModel}) : super(message, roomViewModel){
    fetchedRoomsList();
  }
}
class DontBuildState extends RoomState{
  DontBuildState({required RoomViewModel roomViewModel}) : super(null, roomViewModel);
}

class ReceiveUserEnterPublicRoomMessageState extends  RoomState{

  void addParticipant() {
    if(message.getUser.getNickname != roomViewModel.getUser.getNickname){
      roomViewModel.setParticipantsList(message.getUsersList);
    }
  }

  ReceiveUserEnterPublicRoomMessageState({required EnterPublicRoomData message, required RoomViewModel roomViewModel}) : super(message, roomViewModel){
    addParticipant();
  }
}
class ReceiveBroadEnterPublicRoomMessageState extends  RoomState{

  void addParticipant() {
    if(message.getUser.getNickname != roomViewModel.getUser.getNickname){
      roomViewModel.addParticipants(message.getUser);
    }
  }
  ReceiveBroadEnterPublicRoomMessageState({required EnterPublicRoomData message, required RoomViewModel roomViewModel}) : super(message, roomViewModel){
    addParticipant();
  }
}
class ReceiveMessageState extends RoomState {

  addMessage() {
    // if(boolAdd == true){
    roomViewModel.getRoom.addMessages(message);
    // boolAdd = false;
  }
  ReceiveMessageState({required MessageData message,
    required RoomViewModel roomViewModel}) : super(message, roomViewModel){
    addMessage();
  }
}

class ReceiveTypingMessageState extends RoomState{
  ReceiveTypingMessageState({required RoomViewModel roomViewModel}) : super(null, roomViewModel);
}

class ReceiveStoppedTypingMessageState extends RoomState{
  ReceiveStoppedTypingMessageState({required RoomViewModel roomViewModel}) : super(null, roomViewModel);
}

class SendMessageState extends RoomState{
  SendMessageState({required RoomViewModel roomViewModel}) : super(null, roomViewModel);
}

class SendingMessageState extends RoomState{
  SendingMessageState({required RoomViewModel roomViewModel}) : super(null, roomViewModel);
}

class ReceiveEditMessageState extends RoomState{
  ReceiveEditMessageState({required RoomViewModel roomViewModel}) : super(null, roomViewModel);
}

class ReceiveDeleteMessageState extends RoomState{
  ReceiveDeleteMessageState({required RoomViewModel roomViewModel}) : super(null, roomViewModel);
}

class ReceiveLeavePublicRoomMessageState extends RoomState{
  // ReceiveLeavePublicRoomMessageState({required RoomViewModel roomViewModel}) : super(null, roomViewModel);
  ReceiveLeavePublicRoomMessageState({required LeavePublicRoomData message,
    required RoomViewModel roomViewModel}): super(message, roomViewModel);
}


// class ErrorRoomState extends MessageState{
//   final String message;
//   ErrorRoomState(this.message);
// }
