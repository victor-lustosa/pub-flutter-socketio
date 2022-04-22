part of 'message_bloc.dart';

@immutable
abstract class MessageState <T> {
  MessageState(this.message, this.instance);
  final T message;
  final T instance;
}

class InitialState extends MessageState{
  InitialState({required RoomViewModel instance}) : super(null, instance);
}

class DontBuildState extends MessageState{
  DontBuildState({required RoomViewModel instance}) : super(null, instance);
}

class ReceiveUserEnterPublicRoomMessageState extends  MessageState{

  void addParticipant() {
    if(message.getUser.getNickname != instance.getUser.getNickname){
      instance.setParticipantsList(message.getUsersList);
    }
  }

  ReceiveUserEnterPublicRoomMessageState({required EnterPublicRoomData message, required RoomViewModel instance}) : super(message, instance){
    addParticipant();
  }
}
class ReceiveBroadEnterPublicRoomMessageState extends  MessageState{

  void addParticipant() {
    if(message.getUser.getNickname != instance.getUser.getNickname){
      instance.addParticipants(message.getUser);
    }
  }
  ReceiveBroadEnterPublicRoomMessageState({required EnterPublicRoomData message, required RoomViewModel instance}) : super(message, instance){
    addParticipant();
  }
}
class ReceiveMessageState extends MessageState {

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

class ReceiveTypingMessageState extends MessageState{
  ReceiveTypingMessageState({required RoomViewModel instance}) : super(null, instance);
}

class ReceiveStoppedTypingMessageState extends MessageState{
  ReceiveStoppedTypingMessageState({required RoomViewModel instance}) : super(null, instance);
}

class SendMessageState extends MessageState{
  SendMessageState({required RoomViewModel instance}) : super(null, instance);
}

class SendingMessageState extends MessageState{
  SendingMessageState({required RoomViewModel instance}) : super(null, instance);
}

class ReceiveEditMessageState extends MessageState{
  ReceiveEditMessageState({required RoomViewModel instance}) : super(null, instance);
}

class ReceiveDeleteMessageState extends MessageState{
  ReceiveDeleteMessageState({required RoomViewModel instance}) : super(null, instance);
}

class ReceiveLeavePublicRoomMessageState extends MessageState{
  // ReceiveLeavePublicRoomMessageState({required RoomViewModel instance}) : super(null, instance);
   ReceiveLeavePublicRoomMessageState({required LeavePublicRoomData message,
     required RoomViewModel instance}): super(message, instance);
}


// class ErrorRoomState extends MessageState{
//   final String message;
//   ErrorRoomState(this.message);
// }
