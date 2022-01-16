import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/app_colors.dart';


class EstablishmentTitleSliverWidget extends StatelessWidget {
  const EstablishmentTitleSliverWidget();

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 40, bottom: 0),
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
                padding: const EdgeInsets.only(left: 0,top: 8),
                child: Icon(Icons.search_rounded, color: Colors.white, size: 23),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10,top: 8),
                child: Icon(Icons.menu, color: Colors.white, size: 24),
              ),
            ],
          )
        ]);
  }
}
