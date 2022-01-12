import 'package:pub/app/models/user.dart';

import 'message.dart';
class Sala {
  late int _idSala;
  late String _nome;
  late String _icone;
  late bool _publica;
  late List<User> _listUsuario;
  late Message _mensagem;

  Sala();
  Sala.with_parameters(this._nome, this._listUsuario);

  void insereUsuario(User usuario) {
    getListUsuario.add(usuario);
  }

  //GETTERS
  get getNome => _nome;
  get getListUsuario => _listUsuario;
  get getMensagem => _mensagem;
  get getIdSala => _idSala;
  get getIcone => _icone;
  get isPublica => _publica;

//SETTERS
  setNome(String nome) => _nome = nome;
  setUsuario(List<User> listUsuario) => _listUsuario = listUsuario;
  setMensagem(Message mensagem) => _mensagem = mensagem;
  setIcone(String icone) => _icone = icone;
  setIdSala(int value) => _idSala = value;
  setPublica(bool publica) => _publica = publica;

}