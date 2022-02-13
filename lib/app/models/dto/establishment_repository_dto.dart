import 'package:pub/app/models/room.dart';
class EstablishmentRepositoryDTO {
  late String _latitude;
  late String _longitude;

  EstablishmentRepositoryDTO(this._latitude,this._longitude);

  String get longitude => _longitude;

  set longitude(String value) {
    _longitude = value;
  }

  String get latitude => _latitude;

  set latitude(String value) {
    _latitude = value;
  }
}

