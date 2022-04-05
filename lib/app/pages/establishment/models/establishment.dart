import 'package:pub/app/pages/room/models/room.dart';
class Establishment {
  late String _name;
  late double _latitude;
  late double _longitude;
  late Room _room;

  Establishment();
  Establishment.repository(this._latitude,this._longitude);
  Establishment.withJson (Map json) :
        _name = json['name'],
        _latitude = json['latitude'],
        _longitude = json['longitude'];

  //GETTERS
  get getName => _name;
  get getLatitude => _latitude;
  get getLongitude => _longitude;
  get getRoom => _room;

//SETTERS
  setName(String nome) => _name = nome;
  setLatitude(double latitude) => _latitude = latitude;
  setLongitude(double longitude) => _longitude = longitude;
  setRoom(Room room) => _room = room;
}

