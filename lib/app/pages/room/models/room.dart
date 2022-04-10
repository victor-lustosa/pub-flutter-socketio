
import 'package:pub/app/pages/user/models/user.dart';

import '../../../core/models/data/message_data.dart';
class Room {
  late int _idRoom;
  late String _roomName;
  late String _userNickName;
  late String _icon;
  late bool _isPublic;
  List<dynamic> _usersList = [];
  List<dynamic> _messagesList = [];

  Room.withoutParameters();

  void addUsers(User user) {
    getUsersList.add(user);
  }
  addMessages(dynamic initialMessageData) {
    _messagesList.add(initialMessageData);
  }
  //GETTERS
  get getUserNickName => _userNickName;
  get getRoomName => _roomName;
  get getUsersList => _usersList;
  get getMessagesList => _messagesList;
  get getIdRoom => _idRoom;
  get getIcon => _icon;
  get getIsPublic => _isPublic;


//SETTERS
  setUserNickName(String userNickName) => _userNickName = userNickName;
  setRoomName(String roomName) => _roomName = roomName;
  setUsersList(List<User> usersList) => _usersList = usersList;
  setMessage(List<dynamic> messagesList) => _messagesList = messagesList;
  setIcon(String icon) => _icon = icon;
  setIdRoom(int idRoom) => _idRoom = idRoom;
  setIsPublic(bool isPublic) => _isPublic = isPublic;


  Room({
    required idRoom,
    required roomName,
    required userNickName,
    required isPublic,
    required usersList,
    required messagesList,
  })  : _idRoom = idRoom,
        _roomName = roomName,
        _userNickName = userNickName,
        _isPublic = isPublic,
        _usersList = usersList,
        _messagesList = messagesList;

  Map<String, dynamic> toMap() {
    return {
      'idRoom': this._idRoom,
      'roomName': this._roomName,
      'userNickName': this._userNickName,
      'isPublic': this._isPublic,
      'usersList': this._usersList,
      'messagesList': this._messagesList
    };
  }

  Room.fromMap(json)
      : this._idRoom = json['idRoom'],
        this._roomName = json['roomName'],
        this._userNickName = json['userNickName'],
        this._isPublic = json['isPublic'],
        this._usersList = json['usersList'],
        this._messagesList = json['messagesList'];
}

