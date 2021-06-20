import 'package:flutter/material.dart';
import 'package:pub/models/usuario.dart';
import 'package:pub/pages/estabelecimento/lista_estabelecimentos.dart';
import 'package:pub/widget/app_bar/home_usuario_bar_widget.dart';
import 'package:google_fonts/google_fonts.dart';

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

  void avancar(BuildContext context, Usuario usuario){
    Navigator.push(context, MaterialPageRoute(builder: (context) => ListaEstabelecimentos(usuario: usuario)));
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

    var campoNome = TextFormField(
      autofocus: true,
      maxLength: 40,
      validator : _validarNome,
      controller: _controllerNickName,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Nickname',
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF422600)),
        ),),style:GoogleFonts.quantico(fontSize: 17) ,
    );

    var campoIdade = TextFormField(
      autofocus: true,
      validator : _validarIdade,
      controller: _controllerIdade,
      keyboardType: TextInputType.number,
      style:GoogleFonts.quantico(fontSize: 17),
      decoration: InputDecoration(
        hintText: 'Idade',
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF422600)),
        ),
      ),
    );

    var dropdownGenero = DropdownButton<String>(
      items: _generos.map<DropdownMenuItem<String>>((String val) {
        return DropdownMenuItem<String>(
            value: val,
            child:Container(
              width:257,child: Padding(padding: EdgeInsets.only(),
              child:Text(val,style:GoogleFonts.quantico(fontSize: 17,color: Colors.black54)),),
            ));
      }).toList(),
      hint: Row(
          children: [
            Padding(padding: EdgeInsets.only(bottom: 12),child:Text("Gênero")),
          ]),
      style:GoogleFonts.quantico(fontSize: 17),
      onChanged: (newValue) {
        _dropDownItemSelected(newValue!);
        this.setState(() {
          print(newValue.toString());
          this._selectedGenero = newValue;
        });
      },
      value:selected ? _selectedGenero : null,
    );

    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child:Material(
            child:SingleChildScrollView(
                child:Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color:  Color(0xFF422600)),
                    child: Column(
                        children: [
                          HomeUsuarioBarWidget(),
                          Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topRight:Radius.circular(17),topLeft:Radius.circular(17))),
                              child: Stack(
                                children: <Widget> [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    height: 600,
                                    width: double.maxFinite,
                                    child: Column(
                                      children: <Widget> [
                                        Padding(
                                          padding: EdgeInsets.only(top: 30),
                                          child:  Container(
                                              width: 280.0,
                                              height: 60,
                                              child: Form(
                                                  autovalidateMode: AutovalidateMode.always,
                                                  child:campoNome)),),
                                        Padding(
                                          padding: EdgeInsets.only(top: 25),
                                          child:  Container(
                                            width: 280.0,
                                            height: 60,
                                            child: Form(
                                              autovalidateMode: AutovalidateMode.always,
                                              child: campoIdade,),),),
                                        Padding(
                                            padding: EdgeInsets.only(top: 45),
                                            child: Form(
                                              autovalidateMode: AutovalidateMode.always,
                                              child: dropdownGenero,)),
                                        Padding(
                                          padding: EdgeInsets.only(top: 70),
                                          child: Row( children: <Widget> [
                                            Padding(
                                                padding: EdgeInsets.only(bottom: 40),child: ElevatedButton(
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
                                                  if(this.usuario != null) {
                                                    avancar(context, this.usuario);
                                                  }},
                                                child: Text("Avançar",style:GoogleFonts.quantico(fontSize: 15,color: Colors.white)),
                                                style: ButtonStyle(
                                                  backgroundColor: MaterialStateProperty.all(Color(0xFFB87333)),
                                                  padding:MaterialStateProperty.all( EdgeInsets.symmetric(horizontal: 50)),
                                                ))),],
                                            mainAxisAlignment: MainAxisAlignment.center, ),),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                          )])))));
  }

  void _dropDownItemSelected(String novoItem){
    setState(() {
      this._selectedGenero = novoItem;
      this.selected = true;
    });
  }
}

