
import '../data/data.dart';
import '../bloc_events.dart';

class RoomsListData extends Data{

  List<dynamic> _roomsList = [];

  get getRoomsList => _roomsList;

  Map<String, dynamic> toMap() {
    return {
      'roomsList': this.getRoomsList,
      'type': super.type.toString(),
    };
  }

  factory RoomsListData.fromMap(Map<String, dynamic> map) {
    return RoomsListData(
        roomsList: map['roomsList'],
        type: BlocEventType.values.firstWhere((element) => element.name.toString() == map['type']));
  }

  RoomsListData({
    required roomsList,
    required type,
  })  : _roomsList = roomsList,
        super(type: type);
}
// setRoomsList(List<dynamic> usersList) => _roomsList = usersList;