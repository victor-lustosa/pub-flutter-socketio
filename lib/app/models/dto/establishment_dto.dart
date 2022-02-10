import 'package:pub/app/models/establishment.dart';
import 'package:pub/app/models/room.dart';

import '../user.dart';
class EstablishmentDTO {
  late Establishment _establishment;
  late User _user;
  EstablishmentDTO();
  EstablishmentDTO.establishment(User user, Establishment establishment);
  EstablishmentDTO.room(Establishment establishment, User user);
  Establishment get establishment => _establishment;

  set establishment(Establishment value) {
    _establishment = value;
  }

  User get user => _user;

  set user(User value) {
    _user = value;
  }
}

