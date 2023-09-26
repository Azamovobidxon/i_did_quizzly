import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

import '../../../style/app_colors.dart';

class AppBarPageThree extends StatelessWidget {
  const AppBarPageThree({super.key, required this.correctAnswers});

  final int correctAnswers;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(
          height: 350,
          width: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
              color: AppColors.backGRColor,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: AppColors.whiteColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 290.0, left: 40),
          child: Card(
            shadowColor: AppColors.blackColor,
            child: SizedBox(
              height: 150,
              width: 310,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.cardColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60.0, left: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                height: 20,
                                width: 20,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: AppColors.colorGreen,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "$correctAnswers",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: AppColors.colorGreen),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                            ],
                          ),
                          const Text(
                            "Correct",
                            style: TextStyle(),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 60.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                height: 20,
                                width: 20,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: AppColors.colorwrongRed,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "${10 - correctAnswers}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: AppColors.colorwrongRed),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                            ],
                          ),
                          const Text(
                            "Wrong",
                            style: TextStyle(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Center(
          child: AvatarGlow(
            endRadius: 180.0,
            child: Material(
              // Replace this child with your own
              elevation: 8.0,
              shape: const CircleBorder(),
              child: CircleAvatar(
                backgroundColor: AppColors.whiteColor,
                radius: 60.0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Column(
                    children: [
                      const Text(
                        "Your Score",
                        style: TextStyle(
                            color: AppColors.backGRColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "${correctAnswers * 10}",
                        style: const TextStyle(
                            color: AppColors.backGRColor,
                            fontSize: 32,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
