import 'package:flutter/material.dart';

import '../../../../core/configs/app_colors.dart';
import '../../../../core/room_bloc/room_bloc.dart';
import '../../../room/view_models/room_view_model.dart';
import '../../../user/models/user.dart';


class EstablishmentPageOneWidget extends StatefulWidget {

  EstablishmentPageOneWidget(this.user, this.roomViewModel, this.bloc);
  final RoomBloc bloc;
  final User user;
  final RoomViewModel roomViewModel;

  @override
  State<EstablishmentPageOneWidget> createState() => _EstablishmentPageOneWidgetState();
}

class _EstablishmentPageOneWidgetState extends State<EstablishmentPageOneWidget> {



  @override
  void initState() {
    super.initState();
    widget.bloc.add(InitialRoomsListEvent('-10.182325978880673','-48.33803205711477'));
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(color: AppColors.darkBrown),
      child: Container(
          decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10.0),
            topRight: const Radius.circular(10.0))),

      ),
    );
  }
}

