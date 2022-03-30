
import 'package:pub/app/pages/room/models/room.dart';

import '../../../user/models/user.dart';

class RoomDTO {
  late User _user;
  late Room _room;

  RoomDTO(this._user, this._room);

  User get getUser => _user;

  setUser(User value) {
    _user = value;
  }

  Room get getRoom => _room;

  setRoom(Room value) {
    _room = value;
  }
}

