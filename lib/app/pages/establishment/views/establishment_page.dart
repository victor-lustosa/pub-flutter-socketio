import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pub/app/core/configs/app_colors.dart';
import 'package:pub/app/pages/room/view_models/room_view_model.dart';
import 'package:pub/app/pages/user/models/user.dart';
import '../../../core/room_bloc/room_bloc.dart';
import '../../room/models/room.dart';
import 'components/establishment_page_two_widget.dart';
import 'components/establishment_tab_bar_sliver_widget.dart';
import 'components/establishment_flexible_space_bar_widget.dart';
import 'components/establishment_page_one_widget.dart';

class EstablishmentPage extends StatefulWidget {

  EstablishmentPage(this.user);

  final User user;

  @override
  _EstablishmentPageState createState() => _EstablishmentPageState();
}

class _EstablishmentPageState extends State<EstablishmentPage> with SingleTickerProviderStateMixin {

  late final RoomBloc bloc;
  late TabController _tabController;
  late ScrollController _scrollViewController;
  final RoomViewModel roomViewModel = RoomViewModel.withoutParameters();

  @override
  void initState() {
    super.initState();
    bloc = RoomBloc(room:Room.withoutParameters(),user: this.widget.user, instance: roomViewModel);
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
            EstablishmentPageOneWidget(this.widget.user, roomViewModel, bloc),
            EstablishmentPageTwoWidget()
          ])),
    //   floatingActionButton: SizedBox(
    //       height: 32,
    //       width: 136,
    //       child: FloatingActionButton.extended(
    //           onPressed: () {},
    //           label: Text("visão em mapa",
    //               style: GoogleFonts.inter(fontSize: 10.5, color: Colors.white)),
    //           backgroundColor: AppColors.lightBrown,
    //           icon: Icon(Icons.map, size: 15, color: Colors.white))),
    );
  }
}
