part of 'room_bloc.dart';

@immutable
abstract class RoomState <T> {
  RoomState(this.message, this.instance);
  final T message;
  final T instance;
}

class InitialState extends RoomState{
  InitialState({required RoomViewModel instance}) : super(null, instance);
}

class DontBuildState extends RoomState{
  DontBuildState({required RoomViewModel instance}) : super(null, instance);
}

class ReceiveUserEnterPublicRoomMessageState extends  RoomState{

  void addParticipant() {
    if(message.getUser.getNickname != instance.getUser.getNickname){
      instance.setParticipantsList(message.getUsersList);
    }
  }

  ReceiveUserEnterPublicRoomMessageState({required EnterPublicRoomData message, required RoomViewModel instance}) : super(message, instance){
    addParticipant();
  }
}
class ReceiveBroadEnterPublicRoomMessageState extends  RoomState{

  void addParticipant() {
    if(message.getUser.getNickname != instance.getUser.getNickname){
      instance.addParticipants(message.getUser);
    }
  }
  ReceiveBroadEnterPublicRoomMessageState({required EnterPublicRoomData message, required RoomViewModel instance}) : super(message, instance){
    addParticipant();
  }
}
class ReceiveMessageState extends RoomState {

   addMessage() {
    // if(boolAdd == true){
    instance.getRoom.addMessages(message);
    // boolAdd = false;
  }
   ReceiveMessageState({required MessageData message,
     required RoomViewModel instance}) : super(message, instance){
     addMessage();
   }
}

class ReceiveTypingMessageState extends RoomState{
  ReceiveTypingMessageState({required RoomViewModel instance}) : super(null, instance);
}

class ReceiveStoppedTypingMessageState extends RoomState{
  ReceiveStoppedTypingMessageState({required RoomViewModel instance}) : super(null, instance);
}

class SendMessageState extends RoomState{
  SendMessageState({required RoomViewModel instance}) : super(null, instance);
}

class SendingMessageState extends RoomState{
  SendingMessageState({required RoomViewModel instance}) : super(null, instance);
}

class ReceiveEditMessageState extends RoomState{
  ReceiveEditMessageState({required RoomViewModel instance}) : super(null, instance);
}

class ReceiveDeleteMessageState extends RoomState{
  ReceiveDeleteMessageState({required RoomViewModel instance}) : super(null, instance);
}

class ReceiveLeavePublicRoomMessageState extends RoomState{
  // ReceiveLeavePublicRoomMessageState({required RoomViewModel instance}) : super(null, instance);
   ReceiveLeavePublicRoomMessageState({required LeavePublicRoomData message,
     required RoomViewModel instance}): super(message, instance);
}


// class ErrorRoomState extends MessageState{
//   final String message;
//   ErrorRoomState(this.message);
// }
