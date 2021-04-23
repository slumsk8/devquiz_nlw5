import 'package:DevQuiz/challenge/widgets/buttons_challenge/buttons_challenge_widget.dart';
import 'package:DevQuiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:DevQuiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:DevQuiz/core/app_colors.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  @override
  _ChalengePageState createState() => _ChalengePageState();
}

class _ChalengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: SafeArea(top: true, child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [            
            BackButton(
              color: AppColors.darkGreen,
            ),
            QuestionIndicatorWidget(),
          ],
        )),
      ),
      body: QuizWidget(
        title: "O que o Flutter faz em sua totalidade?",
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          bottom: true,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonsChallengeWidget.white(
                label: "Pular",
                onTap: () {},
              ),
              SizedBox(
                width: 7,
              ),
              ButtonsChallengeWidget.green(label: "Confirmar", onTap: () {},)
            ],
          ),
        ),
      ),
    );
  }
}
