import 'package:flutter/material.dart';

import '../../user/models/user.dart';
import '../../user/view_models/user_view_model.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  late final UserViewModel userViewModel;

  @override
  initState(){
    super.initState();
    userViewModel = UserViewModel(User.withoutParameters());
    userViewModel.checkUser(context);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // body: Center(
      //   child: CircularProgressIndicator(
      //       valueColor: AlwaysStoppedAnimation<Color>(
      //           AppColors.darkBrown)
      //   ))
    );
  }
}