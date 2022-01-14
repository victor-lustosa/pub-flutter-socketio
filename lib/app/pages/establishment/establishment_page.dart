import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub/app/config/app_colors.dart';
import 'package:pub/app/config/app_text_styles.dart';
import 'package:pub/app/models/user.dart';
import 'package:pub/app/pages/establishment/stablishment_title_sliver.dart';
import 'establishment_flexible_space_bar_widget.dart';
import 'establishment_page_one_widget.dart';
import 'establishment_page_two_widget.dart';
// import '../../widgets/establishment_page_two_widget.dart';

class EstablishmentPage extends StatefulWidget {
  User user;
  String latitude;
  String longitude;

  EstablishmentPage({required this.user, required this.latitude, required this.longitude });
  @override
  _EstablishmentPageState createState() => _EstablishmentPageState();

}

class _EstablishmentPageState extends State<EstablishmentPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollViewController;
  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
    _tabController = TabController(vsync: this, length: 2);
  }
  @override
  void dispose() {
    _tabController.dispose();
    _scrollViewController.dispose();
    super.dispose();
  }
  @override
  Widget build (BuildContext context) {
    return Scaffold(
          body: NestedScrollView(
              controller: _scrollViewController,
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                   SliverAppBar(automaticallyImplyLeading: false,
                      backgroundColor: AppColors.marromEscuro,
                      title: TitleSliverStablishment(),
                      pinned: true,
                      snap: false,
                       floating: true,
                      expandedHeight: 140.0,
                      collapsedHeight: 70,
                      toolbarHeight: 50,
                      flexibleSpace:  FlexibleSpaceBar(
                        background: EstablishmentFlexibleSpaceBarWidget(this.widget.user),),
                      bottom: TabBar(
                        controller: _tabController,
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
                      )
                  )
                ];},
              body: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                EstablishmentPageOneWidget(usuario:this.widget.user),
                EstablishmentPageTwoWidget()]
              )
          ),
          floatingActionButton: SizedBox(
              height: 32,
              width: 136,
              child: FloatingActionButton.extended(
                  onPressed: () {},
                  label: Text("visão em mapa",
                      style:GoogleFonts.inter(
                          fontSize: 10.5,color: Colors.white)
                  ),
                  backgroundColor: AppColors.marromClaro,
                  icon: Icon(
                      Icons.map,size: 15,
                      color: Colors.white)
              )
          ),);
  }
}