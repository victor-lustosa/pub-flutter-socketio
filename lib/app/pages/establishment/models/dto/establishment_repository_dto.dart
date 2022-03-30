
class EstablishmentRepositoryDTO {
  late String _latitude;
  late String _longitude;

  EstablishmentRepositoryDTO(this._latitude,this._longitude);

  String get getLongitude => _longitude;

  setLongitude(String value) {
    _longitude = value;
  }

  String get getLatitude => _latitude;

  setLatitude(String value) {
    _latitude = value;
  }
}

