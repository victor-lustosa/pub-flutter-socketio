import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:pub/app/models/user.dart';

abstract class IUserViewModel{
  verificaLocalizacao();
  User validaUsuario(TextEditingController _controllerNickName,
                        TextEditingController _controllerIdade,
                        String _selectedGenero, List<String> _generos);
}

class UserViewModel implements IUserViewModel{
  Location location;
  late bool _serviceEnabled;
  PermissionStatus permissionGranted = PermissionStatus.denied;
  User user;
  late LocationData locationData;
  int _idade = 0;

  UserViewModel(this.location, this.user);

  verificaLocalizacao() async{
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

  User validaUsuario(TextEditingController _controllerNickName, TextEditingController _controllerIdade, String _selectedGenero, List<String> _generos){

    this.user.setNickname(_controllerNickName.text);
    _idade = int.tryParse(_controllerIdade.text)!;
    this.user.setIdade(_idade);
    if(_selectedGenero == ''){
      _selectedGenero = _generos[0];
      this.user.setGenero(_selectedGenero);
    }else{
      this.user.setGenero(_selectedGenero);
    }
    return this.user;
  }
}