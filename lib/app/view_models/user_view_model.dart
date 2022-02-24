
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:pub/app/models/user.dart';

abstract class IUserViewModel{
  checkLocation();
  User validateUser(TextEditingController _nickNameController,
                        TextEditingController _ageController,
                        String _selectedGenre, List<String> _listGenres);
}

class UserViewModel implements IUserViewModel{

  Location location;
  late bool _serviceEnabled;
  PermissionStatus permissionGranted = PermissionStatus.denied;
  User user;
  late LocationData locationData;
  double _age = 0;

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
  /* modelo pra fazer o modal de icones*/
  // void _showMyDialog(BuildContext context, String message) async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('Alerta'),
  //         content: SingleChildScrollView(
  //           child: ListBody(
  //             children: <Widget>[
  //               Text('${message}'),
  //             ],
  //           ),
  //         ),
  //         actions: <Widget>[
  //           TextButton(
  //             child: const Text('concordo'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
  User validateUser(TextEditingController _nickNameController,
                    TextEditingController _ageController,
                    String _selectedGenre,
                    List<String> _listGenres){

    this.user.setNickname(_nickNameController.text);
    _age = double.tryParse(_ageController.text)!;
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