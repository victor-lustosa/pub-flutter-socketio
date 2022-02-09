import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub/app/models/establishment.dart';
import 'package:pub/app/models/user.dart';
import 'package:pub/app/pages/establishment/components/establishment_never_scrollable_widget.dart';
import 'package:pub/app/shared/config/app_colors.dart';


class EstablishmentPage extends StatefulWidget {
  User user;
  Establishment establishment;

  EstablishmentPage(this.user, this.establishment);

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
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _establishmentViewModel.establishmentList.length > 6 ?
      // EstablishmentAlwaysScrollableWidget(this._tabController, this._scrollViewController,
      //                                     this.widget.user) :
      // EstablishmentNeverScrollableWidget(this._tabController, this._scrollViewController,
      //                                    this.widget.user),
      body: EstablishmentNeverScrollableWidget(this._tabController, this._scrollViewController,
                                          this.widget.user),
      floatingActionButton: SizedBox(
          height: 32,
          width: 136,
          child: FloatingActionButton.extended(
              onPressed: () {},
              label: Text("visão em mapa",
                  style: GoogleFonts.inter(fontSize: 10.5, color: Colors.white)),
              backgroundColor: AppColors.lightBrown,
              icon: Icon(Icons.map, size: 15, color: Colors.white)
          )
      ),
    );
  }
}
