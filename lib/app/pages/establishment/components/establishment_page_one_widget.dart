import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub/app/shared/config/no_glow_behavior.dart';
import '../../../shared/config/app_colors.dart';
import '../../../models/user.dart';
import '../../../repositories/establishment_repository.dart';
import '../../../shared/config/app_images.dart';
import '../../../view_models/establishment_view_model.dart';
import '../../room/room_page.dart';

class EstablishmentPageOneWidget extends StatelessWidget {
  EstablishmentPageOneWidget(this.user,this._establishmentViewModel);
  User user;

  EstablishmentViewModel _establishmentViewModel;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0,
      decoration: BoxDecoration(
          color: AppColors.darkBrown
      ),
      child: Container(
          decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10.0),
            topRight: const Radius.circular(10.0),
          ),
          ),

          child: FutureBuilder<List<dynamic>>(
              future: _establishmentViewModel.getListEstablishments('-10.182325978880673','-48.33803205711477'),
              initialData: [],
              builder: (context, AsyncSnapshot<List<dynamic>> snapshot){
                switch(snapshot.connectionState) {
                  case ConnectionState.none:
                    break;
                  case ConnectionState.waiting:
                    return Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                            valueColor: new AlwaysStoppedAnimation<Color>(
                                AppColors.darkBrown)
                        ),
                      ],
                    );
                  case ConnectionState.active:
                    break;
                  case ConnectionState.done:
                    if (!snapshot.hasData) {
                      return Column(mainAxisAlignment: MainAxisAlignment.center,
                          children:[ Center(
                              child: CircularProgressIndicator(
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      AppColors.darkBrown)
                              )
                          )
                          ] );
                    }
                    _establishmentViewModel.establishmentList = snapshot.data!;
                    return   ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length ,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: ListTile(
                                leading: Padding(
                                    padding: EdgeInsets.only(left: 25,bottom: 10) ,
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: AppColors.white, borderRadius: BorderRadius.only(
                                        topLeft: const Radius.circular(5.0),
                                        topRight: const Radius.circular(5.0),
                                        bottomLeft: const Radius.circular(5.0),
                                        bottomRight:const Radius.circular(5.0),
                                      ), boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.15),
                                          spreadRadius: 1,
                                          blurRadius: 3,
                                          offset: Offset(1, 3,), // changes position of shadow
                                        ),
                                      ],

                                      ),child: Image.asset(AppImages.light_logo,width: 20,height: 20),)),
                                title: Padding(
                                    padding: EdgeInsets.only(left: 0,bottom: 10) ,
                                    child: Text(
                                        _establishmentViewModel.establishmentList[index].getName,
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
                                              _establishmentViewModel.establishmentList[index],
                                          this.user)
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
      ),
    );
  }
}
