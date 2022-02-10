import 'package:pub/app/models/room.dart';
class Establishment {
  late String _name;
  late double _latitude;
  late double _longitude;
  late Room _room;

  Establishment();

  Establishment.with_JSON (Map json) :
      _name = json['nome'],
      _latitude = json['latit'],
     _longitude = json['longit'];

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

