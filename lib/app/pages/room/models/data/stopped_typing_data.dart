import '../data/data.dart';

import '../bloc_events.dart';

class StoppedTypingData extends Data{

  late String roomName;
  late String userNickName;

  StoppedTypingData({required this.roomName, required this.userNickName,required BlocEventType type}) : super(type: type);

  Map<String, dynamic> toMap() {
    return {
      'roomName': this.roomName,
      'userNickName': this.userNickName,
      'type': super.type.toString(),
    };
  }

  factory StoppedTypingData.fromMap(Map<String, dynamic> map) {
    return StoppedTypingData(
        roomName: map['roomName'],
        userNickName: map['userNickName'],
        type: BlocEventType.values.firstWhere((element) => element.name.toString() == map['type']));
  }
}