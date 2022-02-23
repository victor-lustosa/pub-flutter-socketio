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
  late dynamic _message;
  late String _type;

  Room.withoutParameters();
  void addUsers(User user) {
    getUsersList.add(user);
  }
  //GETTERS
  get getUserNickName => _userNickName;
  get getRoomName => _roomName;
  get getUsersList => _usersList;
  get getMessage => _message;
  get getIdRoom => _idRoom;
  get getIcon => _icon;
  get getIsPublic => _isPublic;
  get getType => _type;


//SETTERS
  setType(SocketEventType type) =>  type = type;
  setUserNickName(String userNickName) => _userNickName = userNickName;
  setRoomName(String roomName) => _roomName = roomName;
  setUsersList(List<dynamic> usersList) => _usersList = usersList;
  setMessage(Message message) => _message = message;
  setIcon(String icon) => _icon = icon;
  setIdRoom(int idRoom) => _idRoom = idRoom;
  setIsPublic(bool isPublic) => _isPublic = isPublic;

  Map toMap() {
    return {
      'idRoom': _idRoom,
      'userNickName': _userNickName,
      'isPublic': _isPublic,
      'usersList': _usersList,
      'message': _message,
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
      message: map['message'],
      type: map['type']
    );
  }

  Room({
    required idRoom,
    required  roomName,
    required userNickName,
    required  isPublic,
    required usersList,
    required  message,
    required  type,
  })
      : _idRoom = idRoom,
        _roomName = roomName,
        _userNickName = userNickName,
        _isPublic = isPublic,
        _usersList = usersList,
        _message = message,
        _type = type;
}

enum SocketEventType { enter_room, leave_room, message }