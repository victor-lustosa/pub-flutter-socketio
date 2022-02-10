import 'package:flutter/material.dart';
import 'package:pub/app/models/establishment.dart';
import 'package:pub/app/shared/config/app_colors.dart';
import 'package:pub/app/models/user.dart';
import 'package:pub/app/pages/establishment/establishment_page.dart';
import 'package:pub/app/view_models/user_view_model.dart';
import 'package:pub/app/shared/components/form_field_widget.dart';
import 'package:pub/app/pages/user/components/user_register_bar_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub/app/shared/components/dropdown_widget.dart';
import 'package:location/location.dart';

import '../../shared/components/Routes.dart';
class UserRegisterPage extends StatefulWidget  {
  _UserRegisterPageState createState() => _UserRegisterPageState();
}

class _UserRegisterPageState extends State<UserRegisterPage> {

  _UserRegisterPageState(){
    _userViewModel.checkLocation();
  }
  final TextEditingController _nickNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  UserViewModel _userViewModel = UserViewModel(Location(), User());

  List<String> _listGenres = ['não informado','masculino', 'feminino'];
  String _selectedGenre = '';
  late String _latitude;
  late String _longitude;
  bool isEnabled = true;
  double age = 0;

  @override
  Widget build (BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Map;
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
                              child:  FormFieldWidget( _nickNameController, 'nickname',)
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 0),
                              child:  FormFieldWidget( _ageController, 'idade')

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
                                    border: Border.all(
                                        color: Colors.black12,
                                        width: 1.0,
                                        style: BorderStyle.solid
                                    ),
                                  ), width: 350, height: 55,
                                  // child: Column(
                                  //     children: [DropdownButtonFormField(items: [],
                                  //       onChanged: (Object? value) {  },)],
                                  // )
                              )),
                          Padding(
                            padding: EdgeInsets.only(top: 95),
                            child: ElevatedButton.icon(

                                onPressed: (){
                                  Establishment establishment = Establishment();
                                  age = double.tryParse(_ageController.text) == null ? 0 : double.tryParse(_ageController.text)!;
                                  if(_ageController.text.isNotEmpty && _nickNameController.text.isNotEmpty) {
                                    User user = _userViewModel.validateUser(_nickNameController, _ageController, _selectedGenre, _listGenres);
                                    establishment.setLatitude(_userViewModel.locationData.latitude!);
                                    establishment.setLongitude(_userViewModel.locationData.longitude!);
                                    if(age >= 18){
                                      Navigator.pushReplacementNamed(context,Routes.ESTABLISHMENT_ROUTE,
                                          arguments:{'user':user ,'establishment': establishment});
                                    }
                                  }
                                },
                                icon: Icon(
                              Icons.navigate_next_rounded,
                              color: AppColors.white,
                            ),
                                label: Text("Avançar",
                                    style:GoogleFonts.inter(
                                        fontSize: 14,
                                        color: Colors.white)
                                ),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                      )
                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                      AppColors.lightBrown),
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

