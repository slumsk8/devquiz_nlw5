import 'package:flutter/material.dart';

import 'package:DevQuiz/challenge/widgets/awnser/awnser_widget.dart';
import 'package:DevQuiz/challenge/widgets/buttons_challenge/buttons_challenge_widget.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/widgets/models/question_model.dart';

class QuizWidget extends StatelessWidget {
  final QuestionModel question;

  const QuizWidget({
    Key? key,
    required this.question,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 64,
          ),
          Text(
            question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          ...question.awnsers.map((e) => AwnserWidget(
            isRight: e.isRight,
            title: e.title,
          )).toList(),
          SizedBox(
            height: 8,
          ),          
        ],
      ),
    );
  }
}
