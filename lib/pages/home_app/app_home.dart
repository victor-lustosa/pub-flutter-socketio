import 'package:flutter/material.dart';
import 'package:pub/widget/app_bar/home_app_bar_widget.dart';
import 'package:pub/widget/app_bar/app_bar_widget.dart';

class AppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child:  HomeAppBarWidget(),


    );
  }
}