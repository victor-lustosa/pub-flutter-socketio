import 'dart:convert';

import 'package:pub/app/models/user.dart';

import 'message.dart';
class Room {
  late int _idRoom;
  late String _name;
  late String _icon;
  late bool _isPublic;
  List<dynamic> _listUsers = [];
  late Message _message;
  late SocketEventType _type;


  Room.withoutParameters();

  void addUser(User user) {
    getListUsers.add(user);
  }

  //GETTERS
  get getName => _name;
  get getListUsers => _listUsers;
  get getMessage => _message;
  get getIdRoom => _idRoom;
  get getIcon => _icon;
  get getIsPublic => _isPublic;
  get getType => _type;


//SETTERS
  setType(SocketEventType type) =>  type = type;
  setName(String name) => _name = name;
  setListUsers(List<User> listUsers) => _listUsers = listUsers;
  setMessage(Message message) => _message = message;
  setIcon(String icon) => _icon = icon;
  setIdRoom(int idRoom) => _idRoom = idRoom;
  setIsPublic(bool isPublic) => _isPublic = isPublic;

  Map toMap() {
    return {
      'idRoom': _idRoom,
      'name': _name,
      'isPublic': _isPublic,
      'listUsers': _listUsers,
      'message': _message.toMap(),
      'type':_type.toString()
    };
  }

  factory Room.fromJson(Map<String, dynamic> map) {
    return Room(
      idRoom: map['idRoom'],
      name: map['name'],
      isPublic: map['isPublic'],
      listUsers: map['listUsers'],
      message: Message.fromMap(map['message']),
      type: SocketEventType.values.firstWhere((element) => element.toString() == map["type"])
    );
  }

  Room({
    required type,
    required idRoom,
    required name,
    required isPublic,
    required listUsers,
    required message,
  })  : _idRoom = idRoom,
        _name = name,
        _isPublic = isPublic,
        _listUsers = listUsers,
        _message = message,
        _type = type;
}
enum SocketEventType { enter_room, leave_room, message }