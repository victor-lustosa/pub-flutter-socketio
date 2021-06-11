import 'package:flutter/material.dart';
import 'package:pub/config/app_text_styles.dart';
class HomeAppBarWidget extends PreferredSize {

  HomeAppBarWidget()
      : super(
      preferredSize: Size.fromHeight(500),
      child: Container(
        // height: 600,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 400,
              width: double.maxFinite,
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(TextSpan(
                    text: "Olá, ",
                    style: AppTextStyles.title,
                  )
                  )
                ],
              ),
            ),
          ],
        ),
     )
  );
}
