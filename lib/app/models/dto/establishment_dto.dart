import 'package:pub/app/models/establishment.dart';
import 'package:pub/app/models/room.dart';

import '../user.dart';
class EstablishmentDTO {
  late User _user;
  late Establishment _establishment;

  EstablishmentDTO(this._user, this._establishment);

  User get user => _user;

  set user(User value) {
    _user = value;
  }

  Establishment get establishment => _establishment;

  set establishment(Establishment value) {
    _establishment = value;
  }
}

