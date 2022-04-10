import 'package:pub/app/core/models/data/data.dart';

import '../../../pages/room/models/bloc_events.dart';

class EnterPublicRoomData extends Data{

  late String _roomName;
  late String _userNickName;
  late int _code;
  late String _textMessage;

  String get userNickName => _userNickName;
  get getRoomName => _roomName;
  get getCode => _code;
  get getType => super.type;
  get getTextMessage => _textMessage;

  setType(BlocEventType type) => super.type = type;
  setRoomName(String roomName) => _roomName = roomName;
  setUserNickName(String userNickName) => _userNickName = userNickName;
  setCode(int code) => _code = code;
  setTextMessage(String textMessage) => _textMessage = textMessage;

  Map<String, dynamic> toMap() {
    return {
      'roomName': this._roomName,
      'userNickName': this._userNickName,
      'textMessage': this._textMessage,
      'code': this._code,
      'type': super.type.name.toString()
    };
  }

  factory EnterPublicRoomData.fromMap(Map<String, dynamic> map) {
    return EnterPublicRoomData(
        roomName: map['roomName'],
        userNickName: map['userNickName'],
        textMessage: map['textMessage'],
        code: map['code'],
        type: BlocEventType.values.firstWhere((element) => element.name.toString() == map['type']));
  }

  EnterPublicRoomData({
    required String roomName,
    required String userNickName,
    required String textMessage,
    required int code,
    required type,
  })  : _roomName = roomName,
        _userNickName = userNickName,
        _textMessage = textMessage,
        _code = code,
        super.withoutRequired(type);


}