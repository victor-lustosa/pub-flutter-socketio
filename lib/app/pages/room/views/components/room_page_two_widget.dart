import 'package:flutter/material.dart';

import '../../../../core/configs/app_colors.dart';
// import '../../repositories/establishment_repository_dto.dart';
// import '../../view_models/establishment_view_model.dart';



class RoomPageTwoWidget extends StatelessWidget {
  RoomPageTwoWidget();

  // EstablishmentViewModel _establishmentViewModel = EstablishmentViewModel(DioEstablishmentRepository(Dio()));
  // late List<dynamic> _establishmentList;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.white,
      ),);
  }
}
