import 'package:pub/app/core/models/data/data.dart';

import '../../../pages/room/models/bloc_events.dart';

class LeavePublicRoomData extends Data{

  late String _roomName;
  late String _userNickName;
  late String _textMessage;

  String get userNickName => _userNickName;
  get getRoomName => _roomName;
  get getType => super.type;
  get getTextMessage => _textMessage;

  setType(BlocEventType type) => super.type = type;
  setRoomName(String roomName) => _roomName = roomName;
  setUserNickName(String userNickName) => _userNickName = userNickName;
  setTextMessage(String textMessage) => _textMessage = textMessage;

  Map<String, dynamic> toMap() {
    return {
      'roomName': this._roomName,
      'userNickName': this._userNickName,
      'textMessage': this._textMessage,
      'type': super.type.name.toString()
    };
  }

  factory LeavePublicRoomData.fromMap(Map<String, dynamic> map) {
    return LeavePublicRoomData(
        roomName: map['roomName'],
        userNickName: map['userNickName'],
        textMessage: map['textMessage'],
        type: BlocEventType.values.firstWhere((element) => element.name.toString() == map['type']));
  }

  LeavePublicRoomData({
    required String roomName,
    required String userNickName,
    required String textMessage,
    required type,
  })  : _roomName = roomName,
        _userNickName = userNickName,
        _textMessage = textMessage,
        super.withoutRequired(type);


}