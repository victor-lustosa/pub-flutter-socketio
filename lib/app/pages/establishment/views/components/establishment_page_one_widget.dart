import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub/app/pages/establishment/models/dto/establishment_repository_dto.dart';
import 'package:dio/dio.dart';
import '../../../../core/configs/app_colors.dart';
import '../../../../core/configs/app_images.dart';
import '../../../../core/configs/app_routes.dart';
import '../../../room/models/dto/room_dto.dart';
import '../../../room/models/room.dart';
import '../../../user/models/user.dart';
import '../../repositories/establishment_repository.dart';
import '../../view_models/establishment_view_model.dart';

class EstablishmentPageOneWidget extends StatefulWidget {

  EstablishmentPageOneWidget(this.user);

  final User user;

  @override
  State<EstablishmentPageOneWidget> createState() => _EstablishmentPageOneWidgetState();
}

class _EstablishmentPageOneWidgetState extends State<EstablishmentPageOneWidget> {
  late final EstablishmentViewModel _establishmentViewModel;
  @override
  void initState() {
    super.initState();
    _establishmentViewModel = EstablishmentViewModel(DioEstablishmentRepository(Dio()),[]);
  }
  @override
  Widget build(BuildContext context) {

    return Container(
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
          child: FutureBuilder(
              future: _establishmentViewModel.getListEstablishments(EstablishmentRepositoryDTO('-10.182325978880673','-48.33803205711477')),
              initialData: [],
              builder: (context, AsyncSnapshot snapshot){
                switch(snapshot.connectionState) {
                  case ConnectionState.none:
                    break;
                  case ConnectionState.waiting:
                    return Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.darkBrown)
                        ),
                      ],
                    );
                  case ConnectionState.active:
                    break;
                  case ConnectionState.done:
                    if (!snapshot.hasData) {
                      return Center(
                          child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.darkBrown)
                          )
                      );
                    }
                    _establishmentViewModel.establishmentList = snapshot.data!;
                    return ListView.builder(
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
                                      ),child: Image.asset(AppImages.lightLogo,width: 20,height: 20),)),
                                title: Padding(
                                    padding: EdgeInsets.only(bottom: 10) ,
                                    child: Text(
                                        _establishmentViewModel.establishmentList[index].getName,
                                        style: GoogleFonts.inter( color: AppColors.brown, fontSize: 18,))
                                ),
                                subtitle:Row(
                                  children: [
                                    Text( '20 pessoas',
                                        style:GoogleFonts.inter( fontSize: 13, color: Colors.black45)),
                                    Padding(
                                        padding: EdgeInsets.only(left: 40) ,
                                        child: Text('3.2 km de distância',
                                            style:GoogleFonts.inter( fontSize: 13, color: Colors.black45))
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  Room room = Room.withoutParameters();
                                  room.setRoomName(_establishmentViewModel.establishmentList[index].getName);
                                  Navigator.pushNamed(context,AppRoutes.PUBLIC_ROOM_ROUTE,
                                      arguments:RoomDTO(this.widget.user, room));
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

