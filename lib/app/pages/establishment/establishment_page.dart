import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub/app/models/establishment.dart';
import 'package:pub/app/shared/config/app_colors.dart';

import 'package:pub/app/models/user.dart';
import 'package:pub/app/pages/establishment/components/establishment_tab_bar_sliver_widget.dart';

import '../../repositories/establishment_repository.dart';
import '../../view_models/establishment_view_model.dart';
import 'components/establishment_flexible_space_bar_widget.dart';
import 'components/establishment_page_one_widget.dart';
import 'components/establishment_page_two_widget.dart';
// import '../../components/establishment_page_two_widget.dart';
import 'package:dio/dio.dart';
class EstablishmentPage extends StatefulWidget {
  User user;
  Establishment establishment;

  EstablishmentPage( this.user, this.establishment);

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
                flexibleSpace: FlexibleSpaceBar(
                  background: EstablishmentFlexibleSpaceBarWidget(this.widget.user),
                ),
                automaticallyImplyLeading: false,
                backgroundColor: AppColors.darkBrown,
                pinned: true,
                snap: false,
                floating: false,
                expandedHeight: 133.0,
                collapsedHeight: 33,
                toolbarHeight: 33,
                bottom: EstablishmentTabBarSliverWidget(_tabController),
              )];},
          body: TabBarView(
              controller: _tabController, children: <Widget>[
            EstablishmentPageOneWidget(this.widget.user,EstablishmentViewModel.instance),
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
