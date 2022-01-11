import 'package:pub/models/usuario_model.dart';

import 'mensagem_model.dart';
class Sala {
  late int _idSala;
  late String _nome;
  late String _icone;
  late bool _publica;
  late List<Usuario> _listUsuario;
  late Mensagem _mensagem;

  Sala();
  Sala.with_parameters(this._nome, this._listUsuario);

  void insereUsuario(Usuario usuario) {
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
  setUsuario(List<Usuario> listUsuario) => _listUsuario = listUsuario;
  setMensagem(Mensagem mensagem) => _mensagem = mensagem;
  setIcone(String icone) => _icone = icone;
  setIdSala(int value) => _idSala = value;
  setPublica(bool publica) => _publica = publica;

}