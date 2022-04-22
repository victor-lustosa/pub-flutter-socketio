import 'package:pub/app/pages/establishment/models/establishment.dart';
import '../../../room/models/room.dart';
import '../../../user/models/user.dart';
class EstablishmentDTO {
  late User _user;

  EstablishmentDTO(this._user);

  get getUser => _user;

  setUser(User value) {
    _user = value;
  }

}

