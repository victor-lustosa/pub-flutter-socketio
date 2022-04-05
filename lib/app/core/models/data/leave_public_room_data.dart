import 'package:pub/app/core/models/data/data.dart';

import '../../../pages/room/models/bloc_events.dart';

class LeavePublicRoomData extends Data{

  late String roomName;
  late String userNickName;

  LeavePublicRoomData({required this.roomName, required this.userNickName,required BlocEventType type}) : super.withoutRequired(type);

  Map<String, dynamic> toMap() {
    return {
      'roomName': this.roomName,
      'userNickName': this.userNickName,
      'type': super.type.toString(),
    };
  }

  factory LeavePublicRoomData.fromMap(Map<String, dynamic> map) {
    return LeavePublicRoomData(
        roomName: map['roomName'],
        userNickName: map['userNickName'],
        type: BlocEventType.values.firstWhere((element) => element.toString() == map['type']));
  }
}