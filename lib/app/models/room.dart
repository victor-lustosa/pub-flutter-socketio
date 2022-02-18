import 'package:pub/app/models/user.dart';

import 'message.dart';
class Room {
  late int _idRoom;
  late String _name;
  late String _icon;
  late bool _public;
  List<User> _listUsers = [];
  late Message _message;
  late SocketEventType _type;



  Room.withParameters({required int idRoom, required String name, required String icon,
    required bool public, required List<User> listUsers, required Message message, required SocketEventType type});

  Room();

  void addUser(User user) {
    getListUsers.add(user);
  }

  //GETTERS
  get getName => _name;
  get getListUsers => _listUsers;
  get getMessage => _message;
  get getIdRoom => _idRoom;
  get getIcon => _icon;
  get isPublic => _public;
  get getType => _type;


//SETTERS
  setType(SocketEventType type) =>  _type = type;
  setName(String name) => _name = name;
  setListUsers(List<User> listUsers) => _listUsers = listUsers;
  setMessage(Message message) => _message = message;
  setIcon(String icon) => _icon = icon;
  setIdRoom(int idRoom) => _idRoom = idRoom;
  setPublic(bool public) => _public = public;

  Map<String, dynamic> toMap() {
    return {
      '_idRoom': this._idRoom,
      '_name': this._name,
      '_icon': this._icon,
      '_public': this._public,
      '_listUsers': this._listUsers,
      '_message': this._message,
      '_type':this._type.toString()
    };
  }

  factory Room.fromMap(Map<String, dynamic> map) {
    return Room.withParameters(
      idRoom: map['_idRoom'] as int,
      name: map['_name'] as String,
      icon: map['_icon'] as String,
      public: map['_public'] as bool,
      listUsers: map['_listUsers'] as List<User>,
      message: map['_message'] as Message,
      type: SocketEventType.values.firstWhere((element) => element.toString() == map["type"])
    );
  }
}
enum SocketEventType { enter_room, leave_room, message }