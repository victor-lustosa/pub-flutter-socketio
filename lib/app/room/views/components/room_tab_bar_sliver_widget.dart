import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/configs/app_colors.dart';

class RoomTabBarSliverWidget extends PreferredSize {
  final TabController tabController;

  RoomTabBarSliverWidget(this.tabController)
      : super(
            preferredSize: Size.fromHeight(0),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: TabBar(
                controller: tabController,
                // isScrollable: true,
                indicator: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(6)), // Creates border
                    color: AppColors.lightBrown),
                indicatorWeight: 0,
                indicatorSize: TabBarIndicatorSize.label,
                labelStyle: GoogleFonts.inter(
                  fontSize: 13, /* fontWeight: FontWeight.w600,*/
                ),
                unselectedLabelStyle: GoogleFonts.inter(
                  fontSize: 13, /*fontWeight: FontWeight.w600,*/
                ),
                indicatorColor: AppColors.darkBrown,
                labelColor: AppColors.white,
                unselectedLabelColor: Colors.grey,
                tabs: <Widget>[
                  SizedBox(
                    height: 18.0,
                    width: 120,
                    child: Tab(
                      text: "sala",
                    ),
                  ),
                  SizedBox(
                    height: 18.0,
                    width: 120,
                    child: Tab(
                      text: "participantes",
                    ),
                  )
                ],
              ),
            ));
}
