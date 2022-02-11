import 'package:flutter/material.dart';
import 'package:pub/app/shared/config/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/config/app_images.dart';

class HomeBarWidget extends PreferredSize {
  HomeBarWidget(BuildContext context)
      : super(
      preferredSize: Size.fromHeight(325),
      child: Container(
          height: 325,
          child: Container(
            decoration: BoxDecoration(color: AppColors.darkBrown),
            child: Column(children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 90),
                  child: Image.asset(AppImages.dark_logo,
                      width: 100, height: 100)),
              Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    "APP",
                    style: GoogleFonts.gugi(
                      color: AppColors.white,
                      fontSize: 30, /* fontWeight: FontWeight.w600,*/
                    ),
                  )
              ),
            ]
            ),
          )
      )
  );
}
