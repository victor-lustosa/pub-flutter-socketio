import 'package:flutter/material.dart';

import '../../../models/user.dart';
import '../../../shared/config/app_colors.dart';
import '../../../view_models/establishment_view_model.dart';
import 'establishment_flexible_space_bar_widget.dart';
import 'establishment_page_one_widget.dart';
import 'establishment_page_two_widget.dart';
import 'establishment_tab_bar_sliver_widget.dart';

class EstablishmentNeverScrollableWidget extends  StatelessWidget{

  EstablishmentNeverScrollableWidget(this._tabController, this._scrollViewController, this._user);

  final TabController _tabController;
  final ScrollController _scrollViewController;
  final User _user;

  @override
  Widget build(BuildContext context) {

    return CustomScrollView(
          physics: NeverScrollableScrollPhysics(),
          controller: _scrollViewController,
          slivers: <Widget>[
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
              collapsedHeight: 133,
              toolbarHeight: 133,
              bottom: EstablishmentTabBarSliverWidget(_tabController),
            ),
            SliverFillRemaining(child: TabBarView(
                controller: _tabController, children: <Widget>[
              EstablishmentPageOneWidget(this._user,EstablishmentViewModel.instance),
              EstablishmentPageTwoWidget()
            ]
            )
            )
          ]
    );
  }
  }

