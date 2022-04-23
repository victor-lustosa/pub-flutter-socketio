
import '../data/data.dart';
import '../bloc_events.dart';

class InitialRoomsListData extends Data{

  List<dynamic> _roomsList = [];

  get getRoomsList => _roomsList;

  setRoomsList(List<dynamic> usersList) => _roomsList = usersList;

  Map<String, dynamic> toMap() {
    return {
      'roomsList': this.getRoomsList,
      'type': super.type.toString(),
    };
  }

  factory InitialRoomsListData.fromMap(Map<String, dynamic> map) {
    return InitialRoomsListData(
        roomsList: map['roomsList'],
        type: BlocEventType.values.firstWhere((element) => element.name.toString() == map['type']));
  }

  InitialRoomsListData({
    required roomsList,
    required type,
  })  : _roomsList = roomsList,
        super.withoutRequired(type);

}