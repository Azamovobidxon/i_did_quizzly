import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../pages/action_page/action_home_page.dart';

import '../../../style/app_colors.dart';

class DownButton extends StatelessWidget {
  const DownButton({super.key, required this.seconds});

  final int? seconds;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(
        children: [
          CupertinoButton(
            child: SizedBox(
              height: 56.85,
              width: 284.24,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  border: Border.all(
                    width: 2,
                    color: AppColors.backGRColor,
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Play Again",
                    style: TextStyle(
                      color: AppColors.numColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ActionPage(
                    seconds: seconds,
                  ),
                ),
              );
            },
          ),
          CupertinoButton(
            child: SizedBox(
              height: 56.85,
              width: 284.24,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    border: Border.all(
                      width: 2,
                      color: AppColors.backGRColor,
                    )),
                child: const Center(
                  child: Text(
                    "Home",
                    style: TextStyle(
                      color: AppColors.numColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const Padding(
            padding: EdgeInsets.only(top: 11.5),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.backGRColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Center(
                  child: Text(
                    "QUIZZLY",
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
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
