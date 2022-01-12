import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:pub/models/usuario_model.dart';
class UsuarioViewModel {
  Location location = new Location();
  late bool _serviceEnabled;
  PermissionStatus permissionGranted = PermissionStatus.denied;
  Usuario usuario = Usuario();
  late LocationData locationData;
  int _idade = 0;

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

  Usuario validaUsuario(TextEditingController _controllerNickName, TextEditingController _controllerIdade, String _selectedGenero, List<String> _generos){

    this.usuario.setNickname(_controllerNickName.text);
    _idade = int.tryParse(_controllerIdade.text)!;
    this.usuario.setIdade(_idade);
    if(_selectedGenero == ''){
      _selectedGenero = _generos[0];
      this.usuario.setGenero(_selectedGenero);
    }else{
      this.usuario.setGenero(_selectedGenero);
    }
    return this.usuario;
  }
}