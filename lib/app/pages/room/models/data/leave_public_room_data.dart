import '../data/data.dart';

import '../bloc_events.dart';

class LeavePublicRoomData extends Data{
  String _idRoom = '';
  late String _roomName;
  late String _userNickName;
  late String _textMessage;
  late String _user = '';

  String get userNickName => _userNickName;
  get getRoomName => _roomName;
  get getType => super.type;
  get getTextMessage => _textMessage;
  get getUser => _user;
  get getIdRoom => _idRoom;

  Map<String, dynamic> toMap() {
    return {
      'idRoom': this._idRoom,
      'roomName': this._roomName,
      'userNickName': this._userNickName,
      'textMessage': this._textMessage,
      'user': this._user,
      'type': super.type.name.toString()
    };
  }

  factory LeavePublicRoomData.fromMap(Map<String, dynamic> map) {
    return LeavePublicRoomData(
        idRoom: map['idRoom'],
        roomName: map['roomName'],
        userNickName: map['userNickName'],
        textMessage: map['textMessage'],
        user: map['user'],
        type: BlocEventType.values.firstWhere((element) => element.name.toString() == map['type']));
  }

  LeavePublicRoomData({
    required String idRoom,
    required String roomName,
    required String userNickName,
    required String textMessage,
    required user,
    required type,
  })  : _idRoom = idRoom,
        _roomName = roomName,
        _userNickName = userNickName,
        _textMessage = textMessage,
        super(type: type);
}

// setUser(String user) => _user = user;
// setType(BlocEventType type) => super.type = type;
// setRoomName(String roomName) => _roomName = roomName;
// setUserNickName(String userNickName) => _userNickName = userNickName;
// setTextMessage(String textMessage) => _textMessage = textMessage;
