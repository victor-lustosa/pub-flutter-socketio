import 'package:flutter/material.dart';
import 'package:pub/app/core/configs/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
class EnterpriseRegisterBarWidget extends PreferredSize {

  EnterpriseRegisterBarWidget()
      : super(
    preferredSize: Size.fromHeight(325),
    child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 325,
        width: double.maxFinite,
        decoration: BoxDecoration(color: AppColors.darkBrown),
        child:Column(
            children: <Widget> [
              Padding(padding: EdgeInsets.only(top: 85),
                  child: Text("Primeiro acesso",
                      style: GoogleFonts.inter( color: AppColors.white, fontSize: 25, /* fontWeight: FontWeight.w600,*/)
                  )
              ),
              Padding(padding: EdgeInsets.only(top: 50),
                  child: Text("Insira seus dados",
                      style: GoogleFonts.inter( color: AppColors.white, fontSize: 17,)
                  )
              ),
              Padding(padding: EdgeInsets.only(top: 55, right: 60),
                  child:Text("Escolha uma imagem",
                      style: GoogleFonts.inter( color: AppColors.white, fontSize: 13,)
                  )
              ),
            ]
        )
    ),
  );
}
