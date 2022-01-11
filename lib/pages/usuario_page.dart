import 'package:flutter/material.dart';
import 'package:pub/config/app_colors.dart';
import 'package:pub/models/usuario_model.dart';
import 'package:pub/pages/estabelecimento_page.dart';
import 'package:pub/widget/app_bar/home_usuario_bar_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
class HomeUsuario extends StatefulWidget  {
  _HomeUsuarioState createState() => _HomeUsuarioState();
}

class _HomeUsuarioState extends State<HomeUsuario> {
  Usuario usuario = Usuario();
  int idade = 0;
  TextEditingController _controllerNickName = TextEditingController();
  TextEditingController _controllerIdade = TextEditingController();

  List<String> _generos = ['Não informado','Masculino', 'Feminino'];
  String _selectedGenero = '';
  bool selected =  false;
  String _dropdownError = '';
  Location location = new Location();
  late String latitude;
  late String longitude;
  late bool _serviceEnabled;
  PermissionStatus _permissionGranted = PermissionStatus.denied;
  late LocationData _locationData;

  void _getEstabelecimentos() async{
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
  }

  String? _validarNome(value) {
    if (value.length == 0) {
      return "Informe seu nickname";
    }
    return null;
  }
  String? _validarIdade(value) {
    if (value.length == 0) {
      return "Informe sua idade";
    }
    return null;
  }

  @override
  Widget build (BuildContext context) {
    _getEstabelecimentos();
    var campoNome = TextFormField(
        autofocus: true,
        maxLength: 40,
        validator : _validarNome,
        controller: _controllerNickName,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            hintText: 'Nickname',
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.marromEscuro)
            )),
        style: GoogleFonts.inter(fontSize: 14));

    var campoIdade = TextFormField(
        autofocus: true,
        validator : _validarIdade,
        controller: _controllerIdade,
        keyboardType: TextInputType.number,
        style:GoogleFonts.inter(fontSize: 14),
        decoration: InputDecoration(
            hintText: 'Idade',
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.marromEscuro)
            )));

    var dropdownGenero = DropdownButton<String>(
      items: _generos.map<DropdownMenuItem<String>>((String val) {
        return DropdownMenuItem<String>(
            value: val,
            child:Container(
                width:257,
                child: Padding(padding: EdgeInsets.only(),
                    child:Text(
                        val,
                        style:GoogleFonts.inter(
                            fontSize: 14,
                            color: Colors.black54)
                    ))));
      }).toList(),
      hint: Row(
          children: [
            Padding(
                padding: EdgeInsets.only(bottom: 12),
                child:Text("Gênero")),
          ]),
      style:GoogleFonts.inter(fontSize: 14),
      onChanged: (newValue) {
        _dropDownItemSelected(newValue!);
        this.setState(() {
          print(newValue.toString());
          this._selectedGenero = newValue;
        });},
      value:selected ? _selectedGenero : null,
    );

    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }},
        child: Scaffold(
            appBar:  HomeUsuarioBarWidget(),
            body: SingleChildScrollView(
                child:Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: AppColors.white),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                        children: <Widget> [
                          Padding(
                              padding: EdgeInsets.only(top: 40),
                              child:  Container(
                                  width: 280.0,
                                  height: 60,
                                  child: Form(
                                      autovalidateMode: AutovalidateMode.always,
                                      child:campoNome))),
                          Padding(
                              padding: EdgeInsets.only(top: 25),
                              child:  Container(
                                  width: 280.0,
                                  height: 60,
                                  child: Form(
                                      autovalidateMode: AutovalidateMode.always,
                                      child: campoIdade))),
                          Padding(
                              padding: EdgeInsets.only(top: 40),
                              child: Form(
                                  autovalidateMode: AutovalidateMode.always,
                                  child: dropdownGenero)),
                          Padding(
                            padding: EdgeInsets.only(top: 85),
                            child: ElevatedButton(
                                onPressed: (){
                                  this.usuario.setNickname(_controllerNickName.text);
                                  idade = int.tryParse(_controllerIdade.text)!;
                                  this.usuario.setIdade(idade);
                                  if(this._selectedGenero == ''){
                                    this._selectedGenero = this._generos[0];
                                    this.usuario.setGenero(this._selectedGenero);
                                  }else{
                                    this.usuario.setGenero(this._selectedGenero);
                                  }
                                  this.latitude = _locationData.latitude.toString();
                                  this.longitude = _locationData.longitude.toString();
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => ListaEstabelecimentos(
                                          usuario: usuario,
                                          latitude:latitude,
                                          longitude:longitude)));
                                },
                                child: Text("Avançar",
                                    style:GoogleFonts.inter(
                                        fontSize: 14,
                                        color: Colors.white)),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0))),
                                  backgroundColor: MaterialStateProperty.all(AppColors.marromClaro),
                                  padding:MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 60)),
                                )),
                          )
                        ])))));
  }

  void _dropDownItemSelected(String novoItem){
    setState(() {
      this._selectedGenero = novoItem;
      this.selected = true;
    });
  }
}

