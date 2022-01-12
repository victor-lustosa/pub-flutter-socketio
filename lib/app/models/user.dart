class User {
  late int _idUsuario;
  late String _nickname;
  late int _idade;
  late String _genero;

  User();

  //GETTERS
  get getNickname => _nickname;
  get getIdade => _idade;
  get getGenero => _genero;

//SETTERS
  setNickname(String nickname) => _nickname = nickname;
  setIdade(int idade) => _idade = idade;
  setGenero(String genero) => _genero = genero;
}