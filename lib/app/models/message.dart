import 'package:pub/app/models/user.dart';

class Message {
  late int _idMensagem;
  late DateTime _dataEnvio;
  late String _textoMensagem;
  late User _usuario;

  Message();
  Message.with_parameters(this._usuario);


  //GETTERS
  get getUsuario => _usuario;
  get getDataEnvio => _dataEnvio;
  get getMensagem => _textoMensagem;
  get getId => _idMensagem;

//SETTERS
  setUsuario(User usuario) => _usuario = usuario;
  setId(int idMensagem) => _idMensagem = idMensagem;
  setDataEnvio(DateTime dataEnvio) => _dataEnvio = dataEnvio;
  setTextoMensagem(String textoMensagem) => _textoMensagem = textoMensagem;
}