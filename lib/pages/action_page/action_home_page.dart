import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../logic/math_generator.dart';
import '../../../pages/correct_wrong/correct_wrong_home_page.dart';

import '../../style/app_colors.dart';

class ActionPage extends StatefulWidget {
  const ActionPage({
    super.key,
    this.seconds,
  });

  final int? seconds;

  @override
  State<ActionPage> createState() => _ActionPageState();
}

class _ActionPageState extends State<ActionPage> {
  final CountDownController countDownController = CountDownController();
  int correctAnswers = 0;
  int step = 1;
  MathGenerator mathGenerator = MathGenerator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              const SizedBox(
                height: 200,
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
                padding: const EdgeInsets.only(top: 110.0, left: 50),
                child: Card(
                  child: SizedBox(
                    height: 170,
                    width: 280,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.cardColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 60.0),
                            child: Text(
                              "Question ${step.clamp(1, 10).toString().padLeft(2, "0")}/10",
                              style: const TextStyle(
                                color: AppColors.backGRColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Text(
                              mathGenerator.screenText,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: AppColors.numColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 155.0, top: 75),
                child: Stack(
                  children: [
                    SizedBox(
                      height: 90,
                      width: 90,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 9.0, right: 8.0, left: 10.0),
                      child: widget.seconds == null
                          ? const Padding(
                              padding: EdgeInsets.only(top: 25.0),
                              child: Text(
                                "No Second",
                                style: TextStyle(
                                    color: AppColors.backGRColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          : CircularCountDownTimer(
                              controller: countDownController,
                              height: 70,
                              width: 70,
                              duration: widget.seconds!,
                              isReverse: true,
                              fillColor: AppColors.whiteColor,
                              ringColor: AppColors.backGRColor,
                              backgroundColor: AppColors.whiteColor,
                              onComplete: () {
                                step++;
                                if (step == 11) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CorrectWrongHomePage(
                                        correctAnswers: correctAnswers,
                                        seconds: widget.seconds,
                                      ),
                                    ),
                                  );
                                } else {
                                  mathGenerator.restart();
                                  setState(() {});
                                  countDownController.restart(
                                      duration: widget.seconds!);
                                }
                              },
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: mathGenerator.generatorNumbers.map((e) {
              return CupertinoButton(
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
                    child: Center(
                      child: Text(
                        "${e.ceil() != e.floor() ? e.toStringAsFixed(2) : e.toInt()}",
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: AppColors.numColor),
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  if (e == mathGenerator.correctAnswer()) {
                    correctAnswers++;
                  }
                  if (step == 11) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CorrectWrongHomePage(
                          correctAnswers: correctAnswers,
                          seconds: widget.seconds,
                        ),
                      ),
                    );
                  } else {
                    mathGenerator.restart();
                    setState(() {});
                    countDownController.reset();
                  }
                },
              );
            }).toList(),
          )
          // Padding(
          //   padding: const EdgeInsets.only(top: 5.0),
          //   child: Column(
          //     children: [
          //       CupertinoButton(
          //         child: SizedBox(
          //           height: 56.85,
          //           width: 284.24,
          //           child: DecoratedBox(
          //             decoration: BoxDecoration(
          //               borderRadius: const BorderRadius.all(
          //                 Radius.circular(20),
          //               ),
          //               border: Border.all(
          //                 width: 2,
          //                 color: AppColors.backGRColor,
          //               ),
          //             ),
          //             child: const Center(
          //                 child: Text(
          //               "8",
          //               style: TextStyle(
          //                   fontSize: 20,
          //                   fontWeight: FontWeight.w500,
          //                   color: AppColors.numColor),
          //             )),
          //           ),
          //         ),
          //         onPressed: () {},
          //       ),
          //       CupertinoButton(
          //         child: SizedBox(
          //           height: 56.85,
          //           width: 284.24,
          //           child: DecoratedBox(
          //             decoration: BoxDecoration(
          //                 borderRadius: const BorderRadius.all(
          //                   Radius.circular(20),
          //                 ),
          //                 border: Border.all(
          //                   width: 2,
          //                   color: AppColors.backGRColor,
          //                 )),
          //             child: const Center(
          //                 child: Text(
          //               "5",
          //               style: TextStyle(
          //                 color: AppColors.numColor,
          //                 fontSize: 20,
          //                 fontWeight: FontWeight.w500,
          //               ),
          //             )),
          //           ),
          //         ),
          //         onPressed: () {},
          //       ),
          //       CupertinoButton(
          //         child: SizedBox(
          //           height: 56.85,
          //           width: 284.24,
          //           child: DecoratedBox(
          //             decoration: BoxDecoration(
          //                 borderRadius: const BorderRadius.all(
          //                   Radius.circular(20),
          //                 ),
          //                 border: Border.all(
          //                   width: 2,
          //                   color: AppColors.backGRColor,
          //                 )),
          //             child: const Center(
          //               child: Text(
          //                 "3",
          //                 style: TextStyle(
          //                   color: AppColors.numColor,
          //                   fontSize: 20,
          //                   fontWeight: FontWeight.w500,
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //         onPressed: () {},
          //       ),
          //       CupertinoButton(
          //         child: SizedBox(
          //           height: 56.85,
          //           width: 284.24,
          //           child: DecoratedBox(
          //             decoration: BoxDecoration(
          //               borderRadius: const BorderRadius.all(
          //                 Radius.circular(20),
          //               ),
          //               border: Border.all(
          //                 width: 2,
          //                 color: AppColors.backGRColor,
          //               ),
          //             ),
          //             child: const Center(
          //               child: Text(
          //                 "16",
          //                 style: TextStyle(
          //                   color: AppColors.numColor,
          //                   fontSize: 20,
          //                   fontWeight: FontWeight.w500,
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //         onPressed: () {},
          //       ),
          //       const Padding(
          //         padding: EdgeInsets.only(top: 38.5),
          //         child: SizedBox(
          //           width: double.infinity,
          //           height: 50,
          //           child: DecoratedBox(
          //             decoration: BoxDecoration(
          //               color: AppColors.backGRColor,
          //               borderRadius: BorderRadius.only(
          //                 topLeft: Radius.circular(35),
          //                 topRight: Radius.circular(35),
          //               ),
          //             ),
          //             child: Center(
          //               child: Text(
          //                 "QUIZZLY",
          //                 style: TextStyle(
          //                   color: AppColors.whiteColor,
          //                   fontSize: 20,
          //                   fontWeight: FontWeight.w500,
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
