import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/config/app_colors.dart';
import '../../../shared/config/app_images.dart';
import '../../../models/user.dart';

class EstablishmentFlexibleSpaceBarWidget extends StatelessWidget {
  EstablishmentFlexibleSpaceBarWidget(this.user);
  User user;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      alignment: AlignmentDirectional.center,
      children: [
        Row(
          children: [
            Padding(
                padding: EdgeInsets.only(top: 25, right: 360),
                child: IconButton(
                    iconSize: 30,
                    icon: Icon(
                      Icons.navigate_before_rounded,
                      color: AppColors.white,
                    ),
                    color: AppColors.darkBrown,
                    onPressed: () {
                      Navigator.pop(context);
                    }
                )
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 50, top:23, bottom: 0),
              child: IconButton(onPressed: (){},iconSize:45,
                  icon: ClipOval(
                  child: Image.asset(AppImages.user_avatar, width: 45, height: 45),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
                padding: EdgeInsets.only(left: 115, top: 19, bottom: 0),
                child: Text(user.getNickname,
                    style: GoogleFonts.inter( color: AppColors.white, fontSize: 15, /* fontWeight: FontWeight.w600,*/)
                )
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(left: 55, bottom: 75),
                child: Text("APP",
                    style: GoogleFonts.inter( color: AppColors.white, fontSize: 20, fontWeight: FontWeight.w500,)
                )
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(left: 0,bottom: 65),
                child: IconButton(
                  iconSize: 30,icon: Icon(Icons.search_rounded, color: Colors.white, size: 23),
                  onPressed: ()  {
                  },
                )
            ),
            Padding(
                padding: const EdgeInsets.only(right: 5,bottom: 65),
                child: IconButton(  iconSize: 30,icon: Icon(Icons.menu, color: Colors.white, size: 24),
                  onPressed: ()  {
                  },
                )
            ),
          ],
        )
      ],
    );
  }
}