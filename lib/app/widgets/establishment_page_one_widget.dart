import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dio/dio.dart';
import 'package:pub/app/config/NoGlowBehavior.dart';
import '../config/app_colors.dart';
import '../config/app_text_styles.dart';
import '../models/user.dart';
import '../pages/room_page.dart';
import '../repositories/establishment_repository.dart';
import '../view_models/establishment_view_model.dart';

class EstablishmentPageOneWidget extends StatelessWidget {
  EstablishmentPageOneWidget(
      {required this.usuario});
  User usuario;

  EstablishmentViewModel _establishmentViewModel = EstablishmentViewModel(DioEstablishmentRepository(Dio()));
  late List<dynamic> _establishmentList;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColors.white
        ),
        child: Column(
            children: [
              Container(
                  child: FutureBuilder<List<dynamic>>(
                      future: _establishmentViewModel.listaEstabelecimentos('-10.182325978880673','-48.33803205711477'),
                      initialData: [],
                      builder: (context, AsyncSnapshot<List<dynamic>> snapshot){
                        switch(snapshot.connectionState) {
                          case ConnectionState.none:
                            break;
                          case ConnectionState.waiting:
                            return Padding(
                                padding: EdgeInsets.only(top: 30),
                                child: Container(
                                    child: Center(
                                        child: CircularProgressIndicator(
                                            valueColor: new AlwaysStoppedAnimation<Color>(
                                                AppColors.marromEscuro)
                                        )
                                    )
                                )
                            );
                          case ConnectionState.active:
                            break;
                          case ConnectionState.done:
                            if (!snapshot.hasData) {
                              return Padding(
                                  padding: EdgeInsets.only(top: 30),
                                  child: Container(
                                      child: Center(
                                          child: CircularProgressIndicator(
                                              valueColor: new AlwaysStoppedAnimation<Color>(
                                                  AppColors.marromEscuro)
                                          )
                                      )
                                  )
                              );
                            }
                            _establishmentList = snapshot.data!;
                            return   ListView.builder(
                              
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: snapshot.data!.length ,
                                itemBuilder: (context, index) {
                                  return ScrollConfiguration(
                                    behavior: NoGlowBehavior(),
                                    child: ListTile(
                                        leading: Padding(
                                            padding: EdgeInsets.only(left: 25,bottom: 20) ,
                                            child: Icon(
                                                Icons.location_on,size: 29,
                                                color: AppColors.corIconeEstabelecimento)
                                        ),
                                        title: Padding(
                                            padding: EdgeInsets.only(left: 5,bottom: 20) ,
                                            child: Text(
                                                _establishmentList[index].getNome,
                                                style: AppTextStyles.fonteLista)
                                        ),
                                        onTap: () {

                                          Navigator.push( context,
                                              MaterialPageRoute( builder:
                                                  (context) => RoomPage(
                                                  establishment: _establishmentList[index],
                                                  user: this.usuario)
                                              )
                                          );
                                        }
                                    ),
                                  );
                                }
                            );
                        }
                        return Text('Unkown error');
                      }
                  )
              )
            ]
        )
    );
  }
}
