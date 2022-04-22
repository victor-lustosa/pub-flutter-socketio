import 'package:flutter/material.dart';
import 'package:pub/app/core/configs/app_colors.dart';
import 'package:pub/app/pages/user/models/user.dart';
import 'package:pub/app/pages/user/view_models/user_view_model.dart';
import 'package:pub/app/core/components/form_field_widget.dart';
import 'components/user_register_bar_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub/app/core/components/dropdown_widget.dart';
import 'package:location/location.dart';
import '../../establishment/models/dto/establishment_dto.dart';
import '../../../core/configs/app_routes.dart';

class UserRegisterPage extends StatefulWidget  {
  _UserRegisterPageState createState() => _UserRegisterPageState();
}

class _UserRegisterPageState extends State<UserRegisterPage> {

  late final UserViewModel _userViewModel;

  @override
  void initState() {
    super.initState();

    _userViewModel = UserViewModel(Location(), User.withoutParameters());
    _userViewModel.checkLocation();
  }
  final TextEditingController _nickNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  final List<String> _listGenres = ['não informado','masculino', 'feminino'];
  String _selectedGenre = '';
  // late String _latitude;
  // late String _longitude;
  bool isEnabled = true;
  int age = 0;
  late User user;

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
                physics: NeverScrollableScrollPhysics(),
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
                                _nickNameController,
                                'nickname',)
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 0),
                              child:  FormFieldWidget(
                                  _ageController,
                                  'idade')

                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 0),
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
                                  ), width: 350, height: 55,
                                  child: Form(
                                      autovalidateMode: AutovalidateMode.always,
                                      child: DropdownWidget(_listGenres, (String retorno){
                                        setState(() {
                                          _selectedGenre = retorno;
                                        });
                                      }, "gênero",))
                              )),
                          Padding(
                            padding: EdgeInsets.only(top: 95),
                            child: ElevatedButton.icon(
                                onPressed: (){

                                  age = int.tryParse(_ageController.text) == null ? 0 : int.tryParse(_ageController.text)!;
                                  if(_ageController.text.isNotEmpty && _nickNameController.text.isNotEmpty) {
                                    if(age >= 18){
                                    user = _userViewModel.validateUser(_nickNameController, _ageController, _selectedGenre, _listGenres);
                                    _userViewModel.saveUser(user);
                                    // _userViewModel.saveLocation();

                                    Navigator.pushNamedAndRemoveUntil(context, AppRoutes.ESTABLISHMENT_ROUTE,
                                                                      (_) => false, arguments:EstablishmentDTO(user));
                                    }
                                  }
                                },
                                icon: Icon(
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
                                  padding:MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 100,vertical: 9)
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

