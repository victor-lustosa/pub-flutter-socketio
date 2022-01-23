class User {
  late int _idUser;
  late String _nickname;
  late double _age;
  late String _genre;

  User();

  //GETTERS
  get getNickname => _nickname;
  get getAge => _age;
  get getGenre => _genre;

//SETTERS
  setNickname(String nickname) => _nickname = nickname;
  setAge(double age) => _age = age;
  setGenre(String genre) => _genre = genre;
}