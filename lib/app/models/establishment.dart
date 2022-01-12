import 'package:pub/app/models/room.dart';
class Establishment {
  late String _nome;
  late double _latitude;
  late double _longitude;
  late Sala _sala;

  Establishment();

  Establishment.with_JSON (Map json) :
      _nome = json['nome'],
      _latitude = json['latit'],
     _longitude = json['longit'];

  //GETTERS
  get getNome => _nome;
  get getLatitude => _latitude;
  get getLongitude => _longitude;
  get getSala => _sala;

//SETTERS
  setNome(String nome) => _nome = nome;
  setLatitude(double latitude) => _latitude = latitude;
  setLongitude(double longitude) => _longitude = longitude;
  setSala(Sala sala) => _sala = sala;
}

