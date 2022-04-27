import '../../../user/models/user.dart';
import '../data/data.dart';
import '../bloc_events.dart';

class EnterPublicRoomData extends Data{
  String _idRoom = '';
  late String _roomName;
  late int _code;
  late User _user;
  late String _textMessage;
  List<dynamic> _usersList = [];

  get getRoomName => _roomName;
  get getCode => _code;
  get getType => super.type;
  get getTextMessage => _textMessage;
  get getUser => _user;
  get getUsersList => _usersList;
  get getIdRoom => _idRoom;

  Map<String, dynamic> toMap() {
    return {
      'idRoom': this._idRoom,
      'roomName': this._roomName,
      'textMessage': this._textMessage,
      'user': this._user.toMap(),
      'code': this._code,
      'usersList': this._usersList,
      'type': super.type.name.toString()
    };
  }

  factory EnterPublicRoomData.fromMap(Map<String, dynamic> map) {
    return EnterPublicRoomData(
        idRoom: map['idRoom'],
        roomName: map['roomName'],
        textMessage: map['textMessage'],
        user: User.fromMap(map['user']),
        code: map['code'],
        usersList : map['usersList'],
        type: BlocEventType.values.firstWhere((element) => element.name.toString() == map['type']));
  }

  EnterPublicRoomData({
    required String idRoom,
    required String roomName,
    required String textMessage,
    required user,
    required int code,
    required usersList,
    required type,
  })  : _idRoom = idRoom,
        _roomName = roomName,
        _textMessage = textMessage,
        _user = user,
        _code = code,
        _usersList = usersList,
        super(type: type);


// setUser(User user) => _user = user;
// setType(BlocEventType type) => super.type = type;
// setRoomName(String roomName) => _roomName = roomName;
// setCode(int code) => _code = code;
// setTextMessage(String textMessage) => _textMessage = textMessage;
// setUsersList(List<dynamic> usersList) => _usersList = usersList;
}