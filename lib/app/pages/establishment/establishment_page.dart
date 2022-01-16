import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub/app/config/app_colors.dart';

import 'package:pub/app/models/user.dart';
import 'package:pub/app/pages/establishment/widgets/establishment_tab_bar_sliver_widget.dart';
import 'package:pub/app/pages/establishment/widgets/establishment_title_sliver_widget.dart';
import 'widgets/establishment_flexible_space_bar_widget.dart';
import 'widgets/establishment_page_one_widget.dart';
import 'widgets/establishment_page_two_widget.dart';
// import '../../widgets/establishment_page_two_widget.dart';

class EstablishmentPage extends StatefulWidget {
  User user;
  String latitude;
  String longitude;

  EstablishmentPage(
      {required this.user, required this.latitude, required this.longitude});

  @override
  _EstablishmentPageState createState() => _EstablishmentPageState();
}

class _EstablishmentPageState extends State<EstablishmentPage>
    with SingleTickerProviderStateMixin {
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          controller: _scrollViewController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                  bottom: EstablishmentTabBarSliverWidget(_tabController),
                  automaticallyImplyLeading: false,
                  backgroundColor: AppColors.darkBrown,
                  title: EstablishmentTitleSliverWidget(),
                  pinned: true,
                  snap: false,
                  floating: true,
                  expandedHeight: 133.0,
                  collapsedHeight: 33,
                  toolbarHeight: 33,
                  flexibleSpace: FlexibleSpaceBar(
                    background: EstablishmentFlexibleSpaceBarWidget(this.widget.user),
                  )),
            ];
          },
          body: TabBarView(controller: _tabController, children: <Widget>[
            EstablishmentPageOneWidget(user: this.widget.user),
            EstablishmentPageTwoWidget()
          ])),
      floatingActionButton: SizedBox(
          height: 32,
          width: 136,
          child: FloatingActionButton.extended(
              onPressed: () {},
              label: Text("visão em mapa",
                  style: GoogleFonts.inter(fontSize: 10.5, color: Colors.white)),
              backgroundColor: AppColors.lightBrown,
              icon: Icon(Icons.map, size: 15, color: Colors.white))),
    );
  }
}
