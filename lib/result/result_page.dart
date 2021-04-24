import 'package:flutter/material.dart';

import 'package:DevQuiz/challenge/widgets/buttons_challenge/buttons_challenge_widget.dart';
import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/home/home_page.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int length;
  final int resultRight;
  const ResultPage({
    Key? key,
    required this.title,
    required this.length,
    required this.resultRight,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.trophy),
            Column(
              children: [
                Text(
                  "Parabéns!",
                  style: AppTextStyles.heading40,
                ),
                SizedBox(height: 16),
                Text.rich(
                  TextSpan(
                      text: "Você concluiu ",
                      style: AppTextStyles.body,
                      children: [
                        TextSpan(
                            text: "\n$title",
                            style: AppTextStyles.bodyBold),
                        TextSpan(
                            text: "\ncom $resultRight de $length acertos!",
                            style: AppTextStyles.body),
                      ]),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 68),
                      child: ButtonsChallengeWidget.purple(
                          label: "Compartilhar", onTap: () {}),
                    )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: ButtonsChallengeWidget.transparent(
                            label: "Voltar ao ínicio",
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            }),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
