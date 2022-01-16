import 'package:flutter/material.dart';
import 'package:pub/app/config/app_colors.dart';
import 'package:pub/app/pages/user/user_register_page.dart';
import 'package:google_fonts/google_fonts.dart';
class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(color: AppColors.darkBrown),
                child: Column(children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: 150),
                      child: Text(
                        "Logo",
                        style: GoogleFonts.inter(color: AppColors.white, fontSize: 25, /* fontWeight: FontWeight.w600,*/),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 200),
                      child: Text(
                        "Bem vindo!",
                        style: GoogleFonts.inter( color: AppColors.white, fontSize: 25, /* fontWeight: FontWeight.w600,*/),
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 330),
                    child: Row(
                      children: <Widget>[
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => UserRegisterPage()));
                          },
                          label: Text("Vamos lá",
                              style: GoogleFonts.inter( color: AppColors.darkBrown, fontSize: 14, /* fontWeight: FontWeight.w600,*/)
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)))),
                            backgroundColor: MaterialStateProperty.all(Colors.white),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(horizontal: 50)),
                          ),
                          icon: Icon(
                            Icons.navigate_next_rounded,
                            color: AppColors.darkBrown,
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  )
                ]))));
  }
}
