import 'package:flutter/material.dart';
import 'package:pub/app/shared/config/app_colors.dart';
import 'package:pub/app/models/user.dart';
import 'package:pub/app/pages/establishment/establishment_page.dart';
import 'package:pub/app/pages/user/components/enterprise_register_bar_widget.dart';
import 'package:pub/app/view_models/user_view_model.dart';
import 'package:pub/app/shared/components/form_field_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub/app/shared/components/dropdown_widget.dart';
import 'package:location/location.dart';

import '../../models/establishment.dart';
class EnterpriseRegisterPage extends StatefulWidget  {
  _EnterpriseRegisterPageState createState() => _EnterpriseRegisterPageState();
}

class _EnterpriseRegisterPageState extends State<EnterpriseRegisterPage> {

  _EnterpriseRegisterPageState(){
    _userViewModel.checkLocation();
  }

  TextEditingController _nickNameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  UserViewModel _userViewModel = UserViewModel(Location(), User());

  List<String> _listGenres = ['Não informado','Masculino', 'Feminino'];
  String _selectedGenre = '';

  double age = 0;

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
            appBar:  EnterpriseRegisterBarWidget(),
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
                              padding: EdgeInsets.only(top: 60),
                              child:  FormFieldWidget(
                                  _nickNameController,
                                  'nickname')
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 28),
                              child:  FormFieldWidget(
                                  _ageController,
                                  'idade')

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
                                      child: DropdownWidget(_listGenres, (String dropdownReturn){
                                        setState(() {
                                          _selectedGenre = dropdownReturn;
                                        });
                                      }, "gênero",))
                              )),
                          Padding(
                            padding: EdgeInsets.only(top: 144),
                            child: ElevatedButton(
                                onPressed: (){
                                  Establishment establishment = Establishment();
                                  age = double.tryParse(_ageController.text) == null ? 0 : double.tryParse(_ageController.text)!;
                                  if(_ageController.text.isNotEmpty && _nickNameController.text.isNotEmpty) {
                                  User user = _userViewModel.validateUser(_nickNameController, _ageController, _selectedGenre, _listGenres);
                                  establishment.setLatitude(_userViewModel.locationData.latitude!);
                                  establishment.setLongitude(_userViewModel.locationData.longitude!);
                                  Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => EstablishmentPage(user, establishment)));
                                  }},
                                child: Text("Avançar",
                                    style:GoogleFonts.inter( fontSize: 15, color: Colors.white)
                                ),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10))
                                      )
                                  ),
                                  backgroundColor: MaterialStateProperty.all(AppColors.lightBrown),
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

