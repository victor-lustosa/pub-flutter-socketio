part of 'room_bloc.dart';

@immutable
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
class LoadingRoomsListState extends RoomState{
  LoadingRoomsListState() : super(null, null);
}
class SuccessRoomsListState extends RoomState{

  double distanceBetweenUserAndEstablishments(User user, double latitude,double longitude) {
    return (Geolocator.distanceBetween(user.getLatitude, user.getLongitude, latitude, longitude) / 1000);
  }

  fetchedRoomsList(){
    roomViewModel.setRoomsList([]);
    for(dynamic roomData in message.getRoomsList){
     Room room = Room.fromMinimalMap(roomData);
     room.setDistance(distanceBetweenUserAndEstablishments(roomViewModel.getUser,room.getLatitude,room.getLongitude));
      roomViewModel.addRoom(room);
    }
  }
  SuccessRoomsListState({required RoomsListData message,required RoomViewModel roomViewModel}) : super(message, roomViewModel){
    fetchedRoomsList();
  }
}
class DontBuildState extends RoomState{
  DontBuildState() : super(null, null);
}

class ReceiveEnterPublicRoomMessageState extends  RoomState{
  @override
 bool isExist = false;
  void addParticipant(dynamic data) {
    if(data.getUser.getNickname != roomViewModel.getUser.getNickname){
      for(dynamic participant in roomViewModel.getRoom.getParticipantsList){
        if(data.getUser.getNickname == participant.getNickname) {
          isExist = true;
        }
      }
      if(!isExist){
       roomViewModel.addParticipants(data);
       isExist = false;
      }
    }
  }

  ReceiveEnterPublicRoomMessageState({required EnterPublicRoomData message, required RoomViewModel roomViewModel}) :
        super(message, roomViewModel){
    addParticipant(message);
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
  ReceiveTypingMessageState() : super(null, null);
}

class ReceiveStoppedTypingMessageState extends RoomState{
  ReceiveStoppedTypingMessageState() : super(null, null);
}

class SendMessageState extends RoomState{
  SendMessageState() : super(null, null);
}

class SendingMessageState extends RoomState{
  SendingMessageState() : super(null, null);
}

class ReceiveEditMessageState extends RoomState{
  ReceiveEditMessageState() : super(null, null);
}

class ReceiveDeleteMessageState extends RoomState{
  ReceiveDeleteMessageState() : super(null, null);
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
