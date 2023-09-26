import 'package:flutter/material.dart';
import '../../../pages/home_page/widgets/next_page_level.dart';
import '../../../style/app_colors.dart';
import '../../../style/app_icons.dart';
import '../../../pages/home_page/widgets/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SizedBox.expand(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.backGRColor,
            image: DecorationImage(
            image: AssetImage(AppIcons.backImage), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              CustomAppBar(),
              NextPageLevel(),
            ],
          ),
        ),
      ),
    );
  }
}
