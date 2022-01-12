import 'package:flutter/material.dart';
import 'package:pub/config/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub/config/app_text_styles.dart';
class HomeEstabelecimentosBarWidget extends PreferredSize {

  HomeEstabelecimentosBarWidget(String nome, TabController _tabController)
      : super(
    preferredSize: Size.fromHeight(115),
    child:Container(
        height: 115,
        width: double.maxFinite,
        child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 120,
                width: double.maxFinite,
                decoration: BoxDecoration(color: AppColors.marromEscuro),
                child:Column(
                    children: <Widget> [
                      Padding(padding: EdgeInsets.only(right: 240,top: 26),
                          child: Text("APP",
                              style: GoogleFonts.inter(
                                color: AppColors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              )
                          )
                      ),
                      Padding(padding: EdgeInsets.only(right: 240,),
                          child: Text(nome,
                              style: GoogleFonts.inter(
                                color: AppColors.white,
                                fontSize: 15, // fontWeight: FontWeight.w600,
                              )
                          )
                      ),
                      TabBar(
                          indicator: UnderlineTabIndicator(),
                          indicatorWeight: 0,
                          labelStyle: AppTextStyles.tabsSelecionadas,  //For Selected tab
                          unselectedLabelStyle: AppTextStyles.tabsNaoSelecionadas,
                          controller: _tabController,
                          indicatorColor: AppColors.white,
                          labelColor: AppColors.white,
                          unselectedLabelColor: Colors.grey,
                          tabs: <Widget>[
                            Tab(text: "Salas disponíveis", ),
                            Tab(text: "Salas privadas",)
                          ]
                      ),
                    ]
                )
        ),
    )
  );
}
