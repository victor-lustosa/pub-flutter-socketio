import '../../../user/models/user.dart';
import '../data/data.dart';

import '../bloc_events.dart';

class MessageData extends Data{
  late String _idMessage;
  late String _createdAt;
  String _idRoom = '';
  late String _roomName;
  late String _textMessage;
  late User _user;
  late int _code;
  int _namePosition = 0;

  get getRoomName => _roomName;
  get getNamePosition => _namePosition;
  get getUser => _user;
  get getCreatedAt => _createdAt;
  get getTextMessage => _textMessage;
  get getIdMessage => _idMessage;
  get getCode => _code;
  get getType => super.type;
  get getIdRoom => _idRoom;

  setNamePosition(int namePosition) => _namePosition = namePosition;

  Map<String, dynamic> toMap() {
    return {
      'idMessage': this._idMessage,
      'idRoom': this._idRoom,
      'roomName': this._roomName,
      'createdAt': this._createdAt,
      'textMessage': this._textMessage,
      'type': super.type.name.toString(),
      'code': this._code,
      'user': this._user.toMap()
    };
  }

  factory MessageData.fromMap(Map<String,dynamic> map) {
    return MessageData(
        idRoom: map['idRoom'],
        idMessage: map['idMessage'],
        roomName: map['roomName'],
        createdAt: map['createAt'],
        textMessage: map['textMessage'],
        user: User.fromMap(map['user']),
        code: map['code'],
        type: BlocEventType.values.firstWhere((element) => element.name.toString() == map['type']));
  }

  MessageData({
    required String idRoom,
    required idMessage,
    required String roomName,
    required createdAt,
    required textMessage,
    required user,
    required code,
    required type,
  }) : _idRoom = idRoom,
       _roomName = roomName,
       _idMessage = idMessage,
       _createdAt = createdAt,
       _textMessage = textMessage,
       _code = code,
       _user = user,
        super(type: type);
}
//SETTERS
//   setUser(User user) => _user = user;
//   setCode(int code) => _code = code;
//   setType(BlocEventType type) => super.type = type;
//   setIdMessage(String idMessage) => _idMessage = idMessage;
//   setRoomName(String roomName) => _roomName = roomName;
//   setCreatedAt(String createdAt) => _createdAt = createdAt;
//   setTextMessage(String textMessage) => _textMessage = textMessage;
