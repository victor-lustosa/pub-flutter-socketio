import 'package:pub/app/core/models/data/data.dart';

import '../../../pages/room/models/bloc_events.dart';

class EnterPublicRoomData extends Data{

  late String _roomName;
  late String _userNickName;
  late int _code;

  String get userNickName => _userNickName;
  get getRoomName => _roomName;
  get getCode => _code;
  get getType => super.type;

  setType(BlocEventType type) => super.type = type;
  setRoomName(String roomName) => _roomName = roomName;
  setUserNickName(String userNickName) => _userNickName = userNickName;
  setCode(int code) => _code = code;

  Map<String, dynamic> toMap() {
    return {
      'roomName': this._roomName,
      'userNickName': this._userNickName,
      'code': this._code,
      'type': super.type.name.toString()
    };
  }

  factory EnterPublicRoomData.fromMap(Map<String, dynamic> map) {
    return EnterPublicRoomData(
        roomName: map['roomName'],
        userNickName: map['userNickName'],
        code: map['code'],
        type: BlocEventType.values.firstWhere((element) => element.name.toString() == map['type']));
  }

  EnterPublicRoomData({
    required String roomName,
    required String userNickName,
    required int code,
    required type,
  })  : _roomName = roomName,
        _userNickName = userNickName,
        _code = code,
        super.withoutRequired(type);


}