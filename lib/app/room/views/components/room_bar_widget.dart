import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub/app/core/configs/app_colors.dart';

import '../../../room/blocs/room_bloc.dart';
import '../../view_models/room_view_model.dart';

class RoomBarWidget extends StatefulWidget {
  RoomBarWidget(this.bloc, this.roomViewModel, this.mSub);

  final RoomBloc bloc;
  final StreamSubscription mSub;
  final RoomViewModel roomViewModel;
  @override
  State<RoomBarWidget> createState() => _RoomBarWidgetState();
}

class _RoomBarWidgetState extends State<RoomBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        // CircleAvatar(
        //     maxRadius: 20,
        //     backgroundColor: Colors.grey,
        //     backgroundImage: widget.contato.urlImagem != null
        //         ? NetworkImage(widget.contato.urlImagem)
        //         : null),
        Padding(
            padding: EdgeInsets.only(top: 0, right: 0),
            child: IconButton(
                iconSize: 30,
                icon: Icon(
                  Icons.navigate_before_rounded,
                  color: AppColors.darkBrown,
                ),
                color: AppColors.darkBrown,
                onPressed: () {
                  widget.bloc.add(LeaveRoomEvent());
                  Navigator.pop(context);
                  widget.roomViewModel.subscription.cancel();
                  widget.mSub.cancel();
                  // widget..subscription.cancel();
                })),
        Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              widget.roomViewModel.getRoom.getRoomName,
              style:
                  GoogleFonts.inter(fontSize: 17, color: AppColors.darkBrown),
            ))
      ],
    );
  }
}
