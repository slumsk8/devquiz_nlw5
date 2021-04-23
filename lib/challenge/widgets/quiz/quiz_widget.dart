import 'package:DevQuiz/challenge/widgets/awnser/awnser_widget.dart';
import 'package:DevQuiz/challenge/widgets/buttons_challenge/buttons_challenge_widget.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;

  const QuizWidget({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 64,
          ),
          Text(
            title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          AwnserWidget(title: "Kit de desenvolvimento de interface de usuário"),
          SizedBox(
            height: 8,
          ),
          AwnserWidget(
              isRight: true,
              isSelcted: true,
              title:
                  "Possibilita a criação de aplicativos compilados nativamente"),
          SizedBox(
            height: 8,
          ),
          AwnserWidget(title: "Acho que é uma marca de café do Himalaia"),
          SizedBox(
            height: 8,
          ),
          AwnserWidget(
              title:
                  "Possibilita a criação de desktops que são muito incríveis"),
        ],
      ),
    );
  }
}
