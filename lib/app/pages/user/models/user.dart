import 'dart:convert';

class User {
  late int _idUser = 0;
  late String _nickname;
  late double _age;
  late String _genre;

  //GETTERS
  get getIdUser => _idUser;
  get getNickname => _nickname;
  get getAge => _age;
  get getGenre => _genre;

//SETTERS
  setIdUser(int idUser) => _idUser = idUser;

  setNickname(String nickname) => _nickname = nickname;
  setAge(double age) => _age = age;
  setGenre(String genre) => _genre = genre;

  Map<String, dynamic> toMap() {
    return {
      'idUser': this._idUser,
      'nickname': this._nickname,
      'age': this._age,
      'genre': this._genre,
    };
  }

  User.withoutParameters();

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      idUser: map['idUser'],
      nickname: map['nickname'],
      age: map['age'],
      genre: map['genre'],
    );
  }
  String toJson() => json.encode(toMap());
  User({
    required idUser,
    required nickname,
    required age,
    required genre,
  })  : _idUser = idUser,
        _nickname = nickname,
        _age = age,
        _genre = genre;
}