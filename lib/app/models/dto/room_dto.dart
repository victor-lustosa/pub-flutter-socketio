import 'package:pub/app/models/establishment.dart';
import 'package:pub/app/models/room.dart';

import '../user.dart';
class RoomDTO {
  late User _user;
  late Room _room;

  RoomDTO(this._user, this._room);

  User get user => _user;

  set user(User value) {
    _user = value;
  }

  Room get room => _room;

  set room(Room value) {
    _room = value;
  }
}

