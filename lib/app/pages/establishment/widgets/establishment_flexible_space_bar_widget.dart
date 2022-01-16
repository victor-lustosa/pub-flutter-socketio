import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_images.dart';
import '../../../models/user.dart';

class EstablishmentFlexibleSpaceBarWidget extends StatelessWidget {
  EstablishmentFlexibleSpaceBarWidget(this.user);

  User user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
            padding: EdgeInsets.only(top: 15),
            child: IconButton(
                iconSize: 30,
                icon: Icon(
                  Icons.navigate_before_rounded,
                  color: AppColors.white,
                ),
                color: AppColors.darkBrown,
                onPressed: () {
                  Navigator.pop(context);
                })),
        Padding(
          padding: EdgeInsets.only(left: 15, top: 20, bottom: 0),
          child: ClipOval(
            child: Image.asset(AppImages.user_avatar, width: 40, height: 40),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(left: 13, top: 20, bottom: 0),
            child: Text(user.getNickname,
                style: GoogleFonts.inter( color: AppColors.white, fontSize: 15, /* fontWeight: FontWeight.w600,*/)
            )
        ),
      ],
    );
  }
}
