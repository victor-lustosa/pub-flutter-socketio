import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/app_colors.dart';

class TitleSliverStablishment extends StatelessWidget {
  const TitleSliverStablishment();

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
      Padding(
          padding: EdgeInsets.only(left: 40, bottom: 30),
          child: Text("APP",
              style: GoogleFonts.inter(
                color: AppColors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ))),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 0,top: 15),
              child: Icon(Icons.search, color: Colors.white, size: 28),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 10,top: 15),
              child: Icon(Icons.menu, color: Colors.white, size: 28),
            ),
          ),
        ],
      )
    ]);
  }
}
