
import '../data/data.dart';
import '../bloc_events.dart';

class RoomsData extends Data{

  List<dynamic> _rooms = [];

  get getRooms => _rooms;

  Map<String, dynamic> toMap() {
    return {
      'rooms': this.getRooms,
      'type': super.type.toString(),
    };
  }

  factory RoomsData.fromMap(Map<String, dynamic> map) {
    return RoomsData(
        rooms: map['rooms'],
        type: BlocEventType.values.firstWhere((element) => element.name.toString() == map['type']));
  }

  RoomsData({
    required rooms,
    required type,
  })  : _rooms = rooms,
        super(type: type);
}
// setRooms(List<dynamic> users) => _rooms = users;