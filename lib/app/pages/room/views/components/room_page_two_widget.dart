import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/configs/app_colors.dart';
import '../../../../core/configs/app_images.dart';
import '../../view_models/room_view_model.dart';

class RoomPageTwoWidget extends StatefulWidget {

  final RoomViewModel instance;

  RoomPageTwoWidget(this.instance);

  @override
  _RoomPageTwoWidgetState createState() => _RoomPageTwoWidgetState();
}

class _RoomPageTwoWidgetState extends State<RoomPageTwoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: AppColors.white,
        ),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: widget.instance.getRoom.getParticipantsList.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: AnimatedBuilder(
                      animation: this.widget.instance,
                      builder: (context, child) {
                        return ListTile(
                            leading: Padding(
                                padding: EdgeInsets.only(left: 25, bottom: 10),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.all(const Radius.circular(5.0)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.15),
                                        spreadRadius: 1,
                                        blurRadius: 3,
                                        offset: Offset(1, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Image.asset(
                                      AppImages.lightLogo, width: 20,
                                      height: 20),)),
                            title: Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Text(widget.instance.getRoom.getParticipantsList[index].getNickname,
                                    style: GoogleFonts.inter(color: AppColors.brown, fontSize: 18,))
                            ),
                            // subtitle:Row(
                            //   children: [
                            //     Text( '20 pessoas',
                            //         style:GoogleFonts.inter( fontSize: 13, color: Colors.black45)),
                            //     Padding(
                            //         padding: EdgeInsets.only(left: 40) ,
                            //         child: Text('3.2 km de distância',
                            //             style:GoogleFonts.inter( fontSize: 13, color: Colors.black45))
                            //     ),
                            //   ],
                            // ),
                            onTap: () {}
                          // Room room = Room.withoutParameters();
                          // room.setRoomName(_establishmentViewModel.establishmentList[index].getName);
                          // Navigator.pushNamed(context,AppRoutes.PUBLIC_ROOM_ROUTE,
                          //     arguments:RoomDTO(this.widget.user, room));
                        );
                      }
                  ));
            }));
  }
}
