import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dio/dio.dart';
import 'package:pub/app/config/NoGlowBehavior.dart';
import '../../config/app_colors.dart';
import '../../config/app_text_styles.dart';
import '../../models/user.dart';
import '../room/room_page.dart';
import '../../repositories/establishment_repository.dart';
import '../../view_models/establishment_view_model.dart';

class EstablishmentFlexibleSpaceBarWidget extends StatelessWidget {
  EstablishmentFlexibleSpaceBarWidget(this.user);
  User user;
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 64, ),
              child: IconButton(iconSize: 30,
                  icon: Icon(Icons.navigate_before_rounded,
                    color: AppColors.white,),
                  color: AppColors.marromEscuro,
                  onPressed: (){
                    Navigator.pop(context);
                  }
              )
          ),
        ],
      ),
      Column(
          children: [
            Padding(
                padding: EdgeInsets.only(left: 110, top: 80, bottom: 0),
                child: Text(user.getNickname,
                    style: GoogleFonts.inter(
                      color: AppColors.white,
                      fontSize: 15, // fontWeight: FontWeight.w600,
                    ))),
          ])],
    );
  }
}
