import '../bloc_events.dart';
import '../data/data.dart';

class PrivateRoomData extends Data{
  String _idPrivateRoom = '';
  late String _idSender;
  late String _idReceiver;
  late int _code;
  late String _textMessage;

  get getIdReceiver => _idReceiver;
  get getIdSender => _idSender;
  get getIdPrivateRoom => _idPrivateRoom;
  get getCode => _code;
  get getType => super.type;
  get getTextMessage => _textMessage;

  Map<String, dynamic> toMap() {
    return {
      'idPrivateRoom': this._idPrivateRoom,
      'idSender': this._idSender,
      'idReceiver': this._idReceiver,
      'textMessage': this._textMessage,
      'code': this._code,
      'type': super.type.name.toString()
    };
  }

  factory PrivateRoomData.fromMap(Map<String, dynamic> map) {
    return PrivateRoomData(
        idPrivateRoom: map['idPrivateRoom'],
        idSender: map['idSender'],
        idReceiver: map['idReceiver'],
        textMessage: map['textMessage'],
        code: map['code'],
        type: BlocEventType.values.firstWhere((element) => element.name.toString() == map['type']));
  }

  PrivateRoomData({
    required String idPrivateRoom,
    required String idSender,
    required String idReceiver,
    required String textMessage,
    required int code,
    required type,
  })  : _idPrivateRoom = idPrivateRoom,
        _idSender = idSender,
        _idReceiver = idReceiver,
        _textMessage = textMessage,
        _code = code,
        super(type: type);



// setUser(User user) => _user = user;
// setType(BlocEventType type) => super.type = type;
// setRoomName(String roomName) => _roomName = roomName;
// setCode(int code) => _code = code;
// setTextMessage(String textMessage) => _textMessage = textMessage;
// setUsers(List<dynamic> users) => _users = users;
}