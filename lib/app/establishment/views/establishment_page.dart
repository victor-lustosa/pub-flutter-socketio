import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub/app/core/configs/app_colors.dart';
import 'package:pub/app/room/view_models/room_view_model.dart';
import 'package:pub/app/user/models/user.dart';

import '../../room/blocs/room_bloc.dart';
import '../../participant/models/participant.dart';
import '../../participant/view_models/participant_view_model.dart';
import '../../room/models/room.dart';
import 'components/establishment_flexible_space_bar_widget.dart';
import 'components/establishment_page_one_widget.dart';
import 'components/establishment_page_two_widget.dart';
import 'components/establishment_tab_bar_sliver_widget.dart';

class EstablishmentPage extends StatefulWidget {
  EstablishmentPage(this.user);

  final User user;

  @override
  _EstablishmentPageState createState() => _EstablishmentPageState();
}

class _EstablishmentPageState extends State<EstablishmentPage>
    with SingleTickerProviderStateMixin {
  late final ScrollController _scrollViewController;
  late final RoomBloc _bloc;
  late TabController _tabController;
  late final RoomViewModel _roomViewModel;
  late final ParticipantViewModel _participantViewModel;

  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
    this._roomViewModel =
        RoomViewModel(user: this.widget.user, room: Room.withoutParameters());

    this._participantViewModel = ParticipantViewModel(
        user: this._roomViewModel.getUser,
        participant: Participant.withoutParameters());
    _bloc = RoomBloc(roomViewModel: _roomViewModel);
    _bloc.add(LoadingRoomsEvent());
    _tabController = TabController(vsync: this, length: 2);
    _roomViewModel.delayForForms(context);
  }
  // @override
  // void didChangeDependencies(){
  //   super.didChangeDependencies();
  //   _bloc.add(LoadingRoomsEvent());
  // }

  @override
  void dispose() {
    _tabController.dispose();
    _bloc.add(DisconnectEvent());
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
                  background:
                      EstablishmentFlexibleSpaceBarWidget(this.widget.user),
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
              )
            ];
          },
          body: TabBarView(controller: _tabController, children: <Widget>[
            EstablishmentPageOneWidget(
                _roomViewModel, _participantViewModel, _bloc),
            EstablishmentPageTwoWidget()
          ])),
      // EstablishmentPageTwoWidget(this._roomViewModel, this._participantViewModel, this._bloc)])),
      floatingActionButton: SizedBox(
          height: 30,
          width: 160,
          child: FloatingActionButton.extended(
            onPressed: () {
              _roomViewModel.openURL(context);
            },
            label: Text("Ajude com sua opinião",
                style: GoogleFonts.inter(fontSize: 10.5, color: Colors.white)),
            backgroundColor: AppColors.lightBrown,
            // icon: Icon(Icons.map, size: 15, color: Colors.white)
          )),
    );
  }
}
