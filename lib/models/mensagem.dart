import 'package:pub/models/usuario.dart';

class Mensagem {
  late int _idMensagem;
  late DateTime _dataEnvio;
  late String _textoMensagem;
  late Usuario _usuario;

  Mensagem();
  Mensagem.with_parameters(this._usuario);


  //GETTERS
  get getUsuario => _usuario;
  get getDataEnvio => _dataEnvio;
  get getMensagem => _textoMensagem;
  get getId => _idMensagem;

//SETTERS
  setUsuario(Usuario usuario) => _usuario = usuario;
  setId(int idMensagem) => _idMensagem = idMensagem;
  setDataEnvio(DateTime dataEnvio) => _dataEnvio = dataEnvio;
  setTextoMensagem(String textoMensagem) => _textoMensagem = textoMensagem;
}