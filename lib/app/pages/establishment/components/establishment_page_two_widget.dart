import 'package:flutter/material.dart';

import '../../../shared/config/app_colors.dart';
// import '../../repositories/establishment_repository.dart';
// import '../../view_models/establishment_view_model.dart';



class EstablishmentPageTwoWidget extends StatelessWidget {
  EstablishmentPageTwoWidget();

  // EstablishmentViewModel _establishmentViewModel = EstablishmentViewModel(DioEstablishmentRepository(Dio()));
  // late List<dynamic> _establishmentList;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 0,
        decoration: BoxDecoration(
            color: AppColors.darkBrown
        ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
      decoration: BoxDecoration(
      color: AppColors.white, borderRadius: BorderRadius.only(
      topLeft: const Radius.circular(10.0),
      topRight: const Radius.circular(10.0),
      ),
      ),),
    );
  }
}
