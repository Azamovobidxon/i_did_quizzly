import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../pages/action_page/action_home_page.dart';
import '../../../style/app_colors.dart';

class NextPageLevel extends StatelessWidget {
  const NextPageLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Column(
        children: [
          const Text(
            "Choose the appropriate level...",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
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
                  color: AppColors.backGRColor,
                  border: Border.all(
                    width: 3,
                    color: AppColors.whiteColor,
                  ),
                ),
                child: const Center(
                    child: Text(
                  "Level 1",
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                )),
              ),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ActionPage(),
                  ));
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
                    color: AppColors.backGRColor,
                    border: Border.all(
                      width: 3,
                      color: AppColors.whiteColor,
                    )),
                child: const Center(
                  child: Text(
                    "Level 2",
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ActionPage(seconds: 20,),
                  ));
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
                  color: AppColors.backGRColor,
                  border: Border.all(
                    width: 3,
                    color: AppColors.whiteColor,
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Level 3",
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ActionPage(seconds: 10,),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
