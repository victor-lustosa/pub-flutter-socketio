import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/app_colors.dart';
import '../../config/app_text_styles.dart';

class EstablishmentSliverTabBar extends  PreferredSize{

  TabController tabController;

   EstablishmentSliverTabBar(this.tabController) : super(
       preferredSize: Size.fromHeight(0),
       child: Padding(
      padding: const EdgeInsets.all(3),
      child: TabBar(
        controller: tabController,
        // isScrollable: true,
        indicator: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10)), // Creates border
            color: AppColors.white),
        indicatorWeight: 0,
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: AppTextStyles.tabsSelecionadas,
        unselectedLabelStyle: AppTextStyles.tabsNaoSelecionadas,
        indicatorColor: AppColors.marromEscuro,
        labelColor: AppColors.marromEscuro,
        unselectedLabelColor: Colors.grey,
        tabs: <Widget>[
          Container(
              height: 23.0,
              width: 160,
              child: Tab(
                text: "salas disponíveis",
              )),
          Container(
              height: 23.0,
              width: 140,
              child: Tab(
                text: "salas privadas",
              )
          )
        ],
      ),
    ));
  }

