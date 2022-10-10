import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub/app/core/configs/app_colors.dart';
import 'package:pub/app/user/views/user_register_page.dart';

import '../../user/models/user.dart';
import 'components/home_bar_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomeBarWidget(context),
        body: Container(
          decoration: BoxDecoration(color: AppColors.darkBrown),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10.0),
                topRight: const Radius.circular(10.0),
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 250),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  UserRegisterPage(User.withoutParameters())));
                    },
                    label: Text("Cadastrar",
                        style: GoogleFonts.inter(
                          color: AppColors.white,
                          fontSize: 14, /* fontWeight: FontWeight.w600,*/
                        )),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.lightBrown),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 100, vertical: 16)),
                    ),
                    icon: Icon(
                      Icons.account_circle,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
