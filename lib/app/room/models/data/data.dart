import 'package:pub/app/room/models/bloc_events.dart';

class Data {
  late BlocEventType type;
  Data({required this.type});

  Map<String, dynamic> toMap() {
    return {
      'type': this.type.toString(),
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
        type: BlocEventType.values
            .firstWhere((element) => element.name.toString() == map['type']));
  }
}
