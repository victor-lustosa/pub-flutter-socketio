import 'dart:convert';

import 'package:pub/app/models/user.dart';

import 'message.dart';
class Room {
  late int _idRoom;
  late String _roomName;
  late String _userNickName;
  late String _icon;
  late bool _isPublic;
  List<dynamic> _usersList = [];
  List<dynamic> _messagesList = [];
  late String _type;


  Room.withoutParameters();

  void addUsers(User user) {
    getUsersList.add(user);
  }
  void addMessages(Message message) {
    getMessagesList.add(message);
  }
  void removeMessages(){
    setMessagesList([]);
  }
  void removeUsers(){
    setMessagesList([]);
  }
  //GETTERS
  get getUserNickName => _userNickName;
  get getRoomName => _roomName;
  get getUsersList => _usersList;
  get getMessagesList => _messagesList;
  get getIdRoom => _idRoom;
  get getIcon => _icon;
  get getIsPublic => _isPublic;
  get getType => _type;


//SETTERS
  setType(SocketEventType type) =>  type = type;
  setUserNickName(String userNickName) => _userNickName = userNickName;
  setRoomName(String roomName) => _roomName = roomName;
  setUsersList(List<User> usersList) => _usersList = usersList;
  setMessagesList(List<Message> messagesList) => _messagesList = messagesList;
  setIcon(String icon) => _icon = icon;
  setIdRoom(int idRoom) => _idRoom = idRoom;
  setIsPublic(bool isPublic) => _isPublic = isPublic;

  Map toMap() {
    return {
      'idRoom': _idRoom,
      'userNickName': _userNickName,
      'isPublic': _isPublic,
      'usersList': _usersList,
      'messagesList': _messagesList,
      'type':_type
    };
  }

  factory Room.fromJson(Map<String, dynamic> map) {
    return Room(
      idRoom: map['idRoom'],
      userNickName: map['userNickName'],
      roomName: map['roomName'],
      isPublic: map['isPublic'],
      usersList: map['usersList'],
      messagesList: map['messagesList'],
      type: map['type']
    );
  }

  Room({
    required type,
    required idRoom,
    required userNickName,
    required roomName,
    required isPublic,
    required usersList,
    required messagesList,
  })  : _idRoom = idRoom,
        _userNickName = userNickName,
        _roomName = roomName,
        _isPublic = isPublic,
        _usersList = usersList,
        _messagesList = messagesList,
        _type = type;
}
enum SocketEventType { enter_room, leave_room, message }