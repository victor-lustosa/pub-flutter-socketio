import 'package:flutter/material.dart';
import 'package:pub/app/config/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub/app/config/app_text_styles.dart';

class EstablishmentBarWidget extends PreferredSize {
  EstablishmentBarWidget(String nome, TabController _tabController, BuildContext context)
      : super(
          preferredSize: Size.fromHeight(140),
          child: Container(
              height: 140,
              width: double.maxFinite,
              decoration: BoxDecoration(color: AppColors.marromEscuro),
              child: Stack(children: <Widget>[
                Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 48, ),
                      child:IconButton(iconSize: 28, icon: Icon(Icons.navigate_before_rounded,color: AppColors.white,),color: AppColors.marromEscuro,
                        onPressed: (){
                          Navigator.pop(context);
                        }

                      )),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(right: 290, top: 25),
                        child: Text("APP",
                            style: GoogleFonts.inter(
                              color: AppColors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ))),

                Padding(
                    padding: EdgeInsets.only(right: 170, top: 7, bottom: 37),
                    child: Text(nome,
                        style: GoogleFonts.inter(
                          color: AppColors.white,
                          fontSize: 15, // fontWeight: FontWeight.w600,
                        ))),
                TabBar(
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
                    controller: _tabController,
                    indicatorColor: AppColors.white,
                    labelColor: AppColors.marromEscuro,
                    unselectedLabelColor: Colors.grey,
                    tabs: <Widget>[
                      Container(
                          height: 23.0,
                          width: 160,
                          child: Tab(
                            text: "Salas disponíveis",
                          )),
                      Container(
                          height: 23.0,
                          width: 140,
                          child: Tab(
                            text: "Salas privadas",
                          ))
                    ]),
              ])],
              ),),
        );
}
