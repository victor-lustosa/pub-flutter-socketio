import 'package:flutter/material.dart';
import 'package:pub/config/app_colors.dart';
import 'package:pub/models/usuario_model.dart';
import 'package:pub/pages/estabelecimento_page.dart';
import 'package:pub/view_models/usuario_view_model.dart';
import 'package:pub/widgets/campo_formulario_widget.dart';
import 'package:pub/widgets/bar_widgets/usuario_bar_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub/widgets/dropdown_widget.dart';

class UsuarioPage extends StatefulWidget  {
  _UsuarioPageState createState() => _UsuarioPageState();
}

class _UsuarioPageState extends State<UsuarioPage> {

  _UsuarioPageState(){
    _usu.verificaLocalizacao();
  }

  TextEditingController _controllerNickName = TextEditingController();
  TextEditingController _controllerIdade = TextEditingController();
  UsuarioViewModel _usu = UsuarioViewModel();

  List<String> _generos = ['Não informado','Masculino', 'Feminino'];
  String _selectedGenero = '';
  bool selected =  false;
  String _dropdownError = '';

  late String _latitude;
  late String _longitude;

  @override
  Widget build (BuildContext context) {

    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
            }
          },
        child: Scaffold(
            appBar:  UsuarioBarWidget(),
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
                              child:  CampoFormularioWidget(
                                      controllerCampoFormulario :_controllerNickName,
                                      nome: 'nickname',
                                      mensagem: 'digite seu nickname')
                              ),
                          Padding(
                              padding: EdgeInsets.only(top: 25),
                              child:  CampoFormularioWidget(
                                      controllerCampoFormulario :_controllerIdade,
                                      nome: 'idade',
                                      mensagem: 'digite sua idade')

                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 40),
                              child: Form(
                                  autovalidateMode: AutovalidateMode.always,
                                  child: DropdownWidget(lista: _generos, callback: (String retorno){
                                    setState(() {
                                      _selectedGenero = retorno;
                                    });
                                  },nome: "gênero",))
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 85),
                            child: ElevatedButton(
                                onPressed: (){
                                  Usuario usuario = _usu.validaUsuario(_controllerNickName, _controllerIdade, _selectedGenero, _generos);
                                  this._latitude = _usu.locationData.latitude.toString();
                                  this._longitude = _usu.locationData.longitude.toString();
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => EstabelecimentoPage(
                                          usuario: usuario,
                                          latitude:_latitude,
                                          longitude:_longitude)
                                    )
                                  );
                                },
                                child: Text("Avançar",
                                    style:GoogleFonts.inter(
                                        fontSize: 14,
                                        color: Colors.white)
                                ),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0)
                                      )
                                  ),
                                  backgroundColor: MaterialStateProperty.all(AppColors.marromClaro),
                                  padding:MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 60)
                                  ),
                                )
                            ),
                          )
                        ]
                    )
                )
            )
        )
    );
  }


}

