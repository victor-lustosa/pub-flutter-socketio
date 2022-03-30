import 'package:pub/app/core/models/data/data.dart';

class EnterPublicRoomData extends Data{

 late String roomName;
 late String userNickName;

 EnterPublicRoomData({required this.roomName, required this.userNickName,required String type}) : super.withoutRequired(type);

 Map<String, dynamic> toMap() {
    return {
      'roomName': this.roomName,
      'userNickName': this.userNickName,
      'type': super.type,
    };
  }

  factory EnterPublicRoomData.fromMap(Map<String, dynamic> map) {
    return EnterPublicRoomData(
      roomName: map['roomName'],
      userNickName: map['userNickName'],
      type: map['type']
    );
  }
}