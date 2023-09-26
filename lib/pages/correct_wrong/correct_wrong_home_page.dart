import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import '../../../pages/correct_wrong/widget/app_bar_page_three.dart';
import '../../../pages/correct_wrong/widget/down_bottom.dart';

class CorrectWrongHomePage extends StatefulWidget {
  const CorrectWrongHomePage({
    super.key,
    required this.correctAnswers,
    required this.seconds,
  });

  final int correctAnswers;
  final int? seconds;

  @override
  State<CorrectWrongHomePage> createState() => _CorrectWrongHomePageState();
}

class _CorrectWrongHomePageState extends State<CorrectWrongHomePage> {
  late final ConfettiController controller;

  @override
  void initState() {
    super.initState();
    controller = ConfettiController(duration: const Duration(seconds: 3))
      ..play();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              AppBarPageThree(correctAnswers: widget.correctAnswers),
              DownButton(seconds: widget.seconds),
            ],
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: controller,
              blastDirectionality: BlastDirectionality
                  .explosive, // don't specify a direction, blast randomly
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple
              ], // manually specify the colors to be used
              // createParticlePath: drawStar, // define a custom shape/path.
            ),
          ),
        ],
      ),
    );
  }
}
