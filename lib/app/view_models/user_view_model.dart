import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:pub/app/models/user.dart';

abstract class IUserViewModel{
  checkLocation();
  User validaUsuario(TextEditingController _nickNameController,
                        TextEditingController _ageController,
                        String _selectedGenre, List<String> _listGenres);
}

class UserViewModel implements IUserViewModel{
  Location location;
  late bool _serviceEnabled;
  PermissionStatus permissionGranted = PermissionStatus.denied;
  User user;
  late LocationData locationData;
  int _age = 0;

  UserViewModel(this.location, this.user);

  checkLocation() async{
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    locationData = await location.getLocation();
  }

  User validaUsuario(TextEditingController _nickNameController, TextEditingController _ageController, String _selectedGenre, List<String> _listGenres){

    this.user.setNickname(_nickNameController.text);
    _age = int.tryParse(_ageController.text)!;
    this.user.setAge(_age);
    if(_selectedGenre == ''){
      _selectedGenre = _listGenres[0];
      this.user.setGenre(_selectedGenre);
    }else{
      this.user.setGenre(_selectedGenre);
    }
    return this.user;
  }
}