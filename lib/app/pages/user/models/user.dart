import 'dart:convert';

class User {
  late String _idUser = '';
  late String _nickname= '';
  late int _age = 0;
  late String _genre= '';

  //GETTERS
  get getIdUser => _idUser;
  get getNickname => _nickname;
  get getAge => _age;
  get getGenre => _genre;

//SETTERS
  setIdUser(String idUser) => _idUser = idUser;

  setNickname(String nickname) => _nickname = nickname;
  setAge(int age) => _age = age;
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