import 'package:flutter/material.dart';
import 'package:pub/app/core/configs/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
class UserRegisterBarWidget extends PreferredSize {

  UserRegisterBarWidget(BuildContext context)
      : super(
    preferredSize: Size.fromHeight(325),
    child: Container(
        height: 325,
        decoration: BoxDecoration(color: AppColors.darkBrown),
        child:Stack(
            fit: StackFit.loose,
            alignment: AlignmentDirectional.center,
            children: <Widget> [
              Row(  mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Padding(
                    padding: EdgeInsets.only(bottom: 160, left: 5),
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
              Padding(padding: EdgeInsets.only(bottom: 100),
                  child: Text("Primeiro acesso",
                      style: GoogleFonts.inter( color: AppColors.white, fontSize: 25, /* fontWeight: FontWeight.w600,*/)
                  )
              ),
              Padding(padding: EdgeInsets.only(top: 50),
                  child: Text("Insira seus dados",
                      style: GoogleFonts.inter( color: AppColors.white, fontSize: 17,)
                  )
              ),
              // Padding(padding: EdgeInsets.only(top: 200, right: 30),
              //     child:Text("Escolha uma imagem",
              //         style: GoogleFonts.inter( color: AppColors.white, fontSize: 13,)
              //     )
              // ),Padding(padding: EdgeInsets.only(left: 180, top: 175), child: IconButton(
              //   icon: const Icon(Icons.account_circle,size: 60),
              //   color: Colors.white,
              //   onPressed: () {},
              // ),)
            ]
        )
    ),
  );
}
