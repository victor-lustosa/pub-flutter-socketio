import 'package:pub/models/sala.dart';
class Estabelecimento {
  late String _nome;
  late String _latitude;
  late String _longitude;
  late Sala _sala;

  Estabelecimento();
  Estabelecimento.with_parameters (this._nome, this._latitude, this._longitude, this._sala);

//GETTERS
  get getNome => _nome;
  get getLatitude => _latitude;
  get getLongitude => _longitude;
  get getSala => _sala;

//SETTERS
  setNome(String nome) => _nome = nome;
  setLatitude(String latitude) => _latitude = latitude;
  setLongitude(String longitude) => _longitude = longitude;
  setSala(Sala sala) => _sala = sala;
}

