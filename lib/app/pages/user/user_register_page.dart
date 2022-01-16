import 'package:flutter/material.dart';
import 'package:pub/app/config/app_colors.dart';
import 'package:pub/app/models/user.dart';
import 'package:pub/app/pages/establishment/establishment_page.dart';
import 'package:pub/app/view_models/user_view_model.dart';
import 'package:pub/app/shared/form_field_widget.dart';
import 'package:pub/app/pages/user/widgets/user_register_bar_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub/app/shared/dropdown_widget.dart';
import 'package:location/location.dart';
class UserRegisterPage extends StatefulWidget  {
  _UserRegisterPageState createState() => _UserRegisterPageState();
}

class _UserRegisterPageState extends State<UserRegisterPage> {

  _UserRegisterPageState(){
    _usu.checkLocation();
  }

  TextEditingController _controllerNickName = TextEditingController();
  TextEditingController _controllerAge = TextEditingController();
  UserViewModel _usu = UserViewModel(Location(), User());

  List<String> _listGenres = ['Não informado','Masculino', 'Feminino'];
  String _selectedGenre = '';

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
            appBar:  UserRegisterBarWidget(),
            body: SingleChildScrollView(
                child:Container(
                                alignment: Alignment.center,
                decoration: BoxDecoration(
                color: AppColors.white, borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10.0),
                topRight: const Radius.circular(10.0),
                ),),
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                child: Column(
                                    children: <Widget> [
                                      Padding(
                                          padding: EdgeInsets.only(top: 60),
                                          child:  FormFieldWidget(
                                                  formFieldController :_controllerNickName,
                                                  name: 'nickname',
                                                  message: 'digite seu nickname')
                                          ),
                                      Padding(
                                          padding: EdgeInsets.only(top: 28),
                                          child:  FormFieldWidget(
                                                  formFieldController :_controllerAge,
                                                  name: 'idade',
                                                  message: 'digite sua idade')

                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(top: 28),
                                          child:Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),
                                                      bottomRight: Radius.circular(10),
                                                      topLeft: Radius.circular(10),
                                                      topRight: Radius.circular(10)),
                                                border: new Border.all(
                                                    color: Colors.black12,
                                                    width: 1.0,
                                                    style: BorderStyle.solid
                                                ),
                                              ), width: 280, height: 38,
                                          child: Form(
                                              autovalidateMode: AutovalidateMode.always,
                                              child: DropdownWidget(list: _listGenres, callback: (String retorno){
                                                setState(() {
                                                  _selectedGenre = retorno;
                                                });
                                              },name: "gênero",))
                                      )),
                                      Padding(
                                        padding: EdgeInsets.only(top: 144),
                                        child: ElevatedButton.icon(
                                            onPressed: (){
                                              User usuario = _usu.validaUsuario(_controllerNickName, _controllerAge, _selectedGenre, _listGenres);
                                              this._latitude = _usu.locationData.latitude.toString();
                                              this._longitude = _usu.locationData.longitude.toString();
                                              Navigator.push(context, MaterialPageRoute(
                                                  builder: (context) => EstablishmentPage(
                                                      user: usuario,
                                                      latitude:_latitude,
                                                      longitude:_longitude)
                                                )
                                              );
                                            },icon: Icon(
                                          Icons.navigate_next_rounded,
                                          color: AppColors.white,
                                        ),
                                            label: Text("Avançar",
                                                style:GoogleFonts.inter( fontSize: 14, color: Colors.white)
                                            ),
                                            style: ButtonStyle(
                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),
                                                          bottomRight: Radius.circular(10),
                                                          topLeft: Radius.circular(10),
                                                          topRight: Radius.circular(10))
                                                  )
                                              ),
                                              backgroundColor: MaterialStateProperty.all(AppColors.lightBrown),
                                              padding:MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 50)
                                              ),
                                            )
                                        ),
                                      )
                                    ]
                                )
                            )
        )
    ));
  }
}

