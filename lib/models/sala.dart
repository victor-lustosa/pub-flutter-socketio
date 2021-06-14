import 'package:pub/models/usuario.dart';
class Sala {
  late String _nome;
  late Usuario _usuario;

  Sala();
  Sala.with_parameters(this._nome, this._usuario);

//GETTERS
  get getNome => _nome;
  get getUsuario => _usuario;

//SETTERS
  setNome(String nome) => _nome = nome;
  setUsuario(Usuario usuario) => _usuario = usuario;
}