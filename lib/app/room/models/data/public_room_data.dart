import '../../../user/models/user.dart';
import '../data/data.dart';
import '../bloc_events.dart';

class PublicRoomData extends Data{
  String _idRoom = '';
  late String _roomName;
  late int _code;
  late User _user;
  late String _textMessage;

  get getRoomName => _roomName;
  get getCode => _code;
  get getType => super.type;
  get getTextMessage => _textMessage;
  get getUser => _user;
  get getIdRoom => _idRoom;

  Map<String, dynamic> toMap() {
    return {
      'idRoom': this._idRoom,
      'roomName': this._roomName,
      'textMessage': this._textMessage,
      'user': this._user.toMap(),
      'code': this._code,
      'type': super.type.name.toString()
    };
  }

  factory PublicRoomData.fromMap(Map<String, dynamic> map) {
    return PublicRoomData(
        idRoom: map['idRoom'],
        roomName: map['roomName'],
        textMessage: map['textMessage'],
        user: User.fromMap(map['user']),
        code: map['code'],
        type: BlocEventType.values.firstWhere((element) => element.name.toString() == map['type']));
  }

  PublicRoomData({
    required String idRoom,
    required String roomName,
    required String textMessage,
    required user,
    required int code,
    required type,
  })  : _idRoom = idRoom,
        _roomName = roomName,
        _textMessage = textMessage,
        _user = user,
        _code = code,
        super(type: type);
}