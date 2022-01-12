import 'package:flutter/material.dart';
import 'package:pub/config/app_colors.dart';
import 'package:pub/config/app_text_styles.dart';
import 'package:google_fonts/google_fonts.dart';
class HomeBarWidget extends PreferredSize {

  HomeBarWidget()
      : super(
    preferredSize: Size.fromHeight(800),
    child: Container(
      height: 250,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 161,
        width: double.maxFinite,
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich( TextSpan (
                text: "Olá, ",
                style: GoogleFonts.inter(
                  color: AppColors.white,
                  fontSize: 25,
                  // fontWeight: FontWeight.w600,
                )
             )
            )
          ],
        ),
      ),
    ),
  );
}
