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
import 'package:geolocator/geolocator.dart';
class EstablishmentPage extends StatefulWidget {

  EstablishmentPage(this.user,);

  final User user;
  late LocationPermission permission;

  @override
  _EstablishmentPageState createState() => _EstablishmentPageState();
}

class _EstablishmentPageState extends State<EstablishmentPage> with SingleTickerProviderStateMixin {

  late final RoomBloc _bloc;
  late TabController _tabController;
  late final RoomViewModel _roomViewModel;

  @override
  void initState() {
    super.initState();

    _roomViewModel = RoomViewModel(scrollViewController: ScrollController(initialScrollOffset: 0.0),
                                   user: this.widget.user,room: Room.withoutParameters());
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
          controller: _roomViewModel.scrollViewController,
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
            EstablishmentPageOneWidget(_roomViewModel, _bloc),
            EstablishmentPageTwoWidget()
          ])),
      floatingActionButton: SizedBox(
          height: 30,
          width: 160,
          child: FloatingActionButton.extended(
              onPressed:(){
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
