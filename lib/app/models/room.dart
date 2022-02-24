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
  setUserNickName(String userNickName) => _userNickName = userNickName;
  setRoomName(String roomName) => _roomName = roomName;
  setUsersList(List<User> usersList) => _usersList = usersList;
  setMessage(Message message) => _message = message;
  setIcon(String icon) => _icon = icon;
  setIdRoom(int idRoom) => _idRoom = idRoom;
  setIsPublic(bool isPublic) => _isPublic = isPublic;


  Room({
    required idRoom,
    required roomName,
    required userNickName,
    required isPublic,
    required usersList,
    required message,
    required type,
  })  : _idRoom = idRoom,
        _roomName = roomName,
        _userNickName = userNickName,
        _isPublic = isPublic,
        _usersList = usersList,
        _message = message,
        _type = type;

  Map toMap() {
    return {
      'idRoom': this._idRoom,
      'roomName': this._roomName,
      'userNickName': this._userNickName,
      'isPublic': this._isPublic,
      'usersList': this._usersList,
      'message': this._message,
      'type': this._type,
    };
  }

  // factory Room.fromMap(Map<String, dynamic> map) {
  //   return Room(
  //     idRoom: map['idRoom'],
  //     roomName: map['roomName'],
  //     userNickName: map['userNickName'],
  //     isPublic: map['isPublic'],
  //     usersList: map['usersList'],
  //     message: map['message'] as Message,
  //     type: map['type']
  //   );
  //
  // }
  Room.fromMap(json)
      : this._idRoom = json['idRoom'],
        this._roomName = json['roomName'],
        this._userNickName = json['userNickName'],
        this._isPublic = json['isPublic'],
        this._usersList = json['usersList'],
        this._message = Message.fromMap(json['message']),
        this._type = json['type'];
}

