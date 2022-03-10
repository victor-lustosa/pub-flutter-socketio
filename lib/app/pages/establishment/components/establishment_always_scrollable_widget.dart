import 'package:flutter/material.dart';
import 'package:pub/app/view_models/establishment_view_model.dart';

import '../../../models/user.dart';
import '../../../shared/config/app_colors.dart';
import 'establishment_flexible_space_bar_widget.dart';
import 'establishment_page_one_widget.dart';
import 'establishment_page_two_widget.dart';
import 'establishment_tab_bar_sliver_widget.dart';

class EstablishmentAlwaysScrollableWidget extends  StatelessWidget{
  EstablishmentAlwaysScrollableWidget(this._tabController, this._scrollViewController, this._user);

  final TabController _tabController;
  final ScrollController _scrollViewController;
  final User _user;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
          controller: _scrollViewController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                flexibleSpace: FlexibleSpaceBar(
                  background: EstablishmentFlexibleSpaceBarWidget(this._user),
                ),
                automaticallyImplyLeading: false,
                backgroundColor: AppColors.darkBrown,
                pinned: true,
                snap: false,
                floating: false,
                expandedHeight: 133.0,
                collapsedHeight: 33,
                toolbarHeight: 33,
                bottom: EstablishmentTabBarSliverWidget(this._tabController),
              )];},
          body: TabBarView(
              controller: _tabController, children: <Widget>[
            EstablishmentPageOneWidget(this._user,EstablishmentViewModel.instance),
            EstablishmentPageTwoWidget()
          ]));
  }
  }

