import 'package:flutter/material.dart';

import '../../../style/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.only(top: 40.0,right: 20,left: 20),
      child: Column(
        children: [
          Text(
            "QUIZZLY",
            style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 67,
                fontWeight: FontWeight.w400),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.0),
            child: Card(
              color: AppColors.cardColor,
              elevation: 7,
              shadowColor: AppColors.cardDropShadov,
              child: SizedBox(
                height: 203,
                width: 361,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 30.0),
                    child: Column(
                      children: [
                        Text(
                          "Welcome to Quizzly!",
                          style: TextStyle(
                              color: AppColors.backGRColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 28),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 10),
                          child: Text(
                              "With Quizzly, you can improve your thinking, intelligence and logical skills.",
                              style: TextStyle(
                                color: AppColors.backGRColor,
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
