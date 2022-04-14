import 'package:pub/app/pages/establishment/models/establishment.dart';
import '../../../user/models/user.dart';
class EstablishmentDTO {
  late User _user;
  late Establishment _establishment;

  EstablishmentDTO(this._user, this._establishment);
  EstablishmentDTO.withoutEstablishment(this._user);

  get getUser => _user;

  setUser(User value) {
    _user = value;
  }

  get getEstablishment => _establishment;

  setEstablishment(Establishment value) {
    _establishment = value;
  }
}

