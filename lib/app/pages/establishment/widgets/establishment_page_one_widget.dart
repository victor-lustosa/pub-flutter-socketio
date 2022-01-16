import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub/app/config/NoGlowBehavior.dart';
import '../../../config/app_colors.dart';
import '../../../models/user.dart';
import '../../../repositories/establishment_repository.dart';
import '../../../view_models/establishment_view_model.dart';
import '../../room/room_page.dart';

class EstablishmentPageOneWidget extends StatelessWidget {
  EstablishmentPageOneWidget(
      {required this.user});
  User user;

  EstablishmentViewModel _establishmentViewModel = EstablishmentViewModel(DioEstablishmentRepository(Dio()));
  late List<dynamic> _establishmentList;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 0,
      decoration: BoxDecoration(
          color: AppColors.darkBrown
      ),
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10.0),
            topRight: const Radius.circular(10.0),
          ),
          ),
          child: Column(
              children: [
                Container(
                    child: FutureBuilder<List<dynamic>>(
                        future: _establishmentViewModel.getListEstablishments('-10.182325978880673','-48.33803205711477'),
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
                                                  AppColors.darkBrown)
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
                                                    AppColors.darkBrown)
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
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 18.0),
                                        child: ListTile(
                                            leading: Padding(
                                                padding: EdgeInsets.only(left: 25,bottom: 10) ,
                                                child: Icon(
                                                    Icons.location_on,size: 39,
                                                    color: AppColors.establishmentIconColor)
                                            ),
                                            title: Padding(
                                                padding: EdgeInsets.only(left: 0,bottom: 10) ,
                                                child: Text(
                                                    _establishmentList[index].getName,
                                                    style: GoogleFonts.inter( color: AppColors.brown, fontSize: 18,))
                                            ),
                                            subtitle:Row(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(left: 0,bottom: 0) ,
                                                    child: Text( '20 pessoas',
                                                        style:GoogleFonts.inter( fontSize: 13, color: Colors.black45))
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(left: 40,bottom: 0) ,
                                                    child: Text('3.2 km de distância',
                                                        style:GoogleFonts.inter( fontSize: 13, color: Colors.black45))
                                                ),
                                              ],
                                            ),
                                            onTap: () {
                                              Navigator.push( context,
                                                  MaterialPageRoute( builder:
                                                      (context) => RoomPage(
                                                      establishment: _establishmentList[index],
                                                      user: this.user)
                                                  )
                                              );
                                            }
                                        ),
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
      ),
    );
  }
}
