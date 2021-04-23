import 'package:DevQuiz/challenge/challenge_controller.dart';
import 'package:flutter/material.dart';

import 'package:DevQuiz/challenge/widgets/buttons_challenge/buttons_challenge_widget.dart';
import 'package:DevQuiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:DevQuiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:DevQuiz/shared/widgets/models/question_model.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  const ChallengePage({
    Key? key,
    required this.questions,
  }) : super(key: key);
  @override
  _ChalengePageState createState() => _ChalengePageState();
}

class _ChalengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();
  @override
  void initState() {
    // aletera a numeração das questões
    // somo mais um pra corrigir o bug da numeração das páginas
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
    super.initState();
  }

  nextPage() {
    pageController.nextPage(
      duration: Duration(milliseconds: 100),
      curve: Curves.easeInToLinear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: SafeArea(
            top: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                ValueListenableBuilder<int>(
                  valueListenable: controller.currentPageNotifier,
                  builder: (context, value, _) => QuestionIndicatorWidget(
                    currentPage: value,
                    length: widget.questions.length,
                  ),
                ),
                // BackButton(
                //   color: AppColors.darkGreen,
                // ),
              ],
            )),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
            .map((e) => QuizWidget(
                  question: e,
                  onChange: () {
                    nextPage();
                  },
                ))
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if(value < widget.questions.length)
                        Expanded(
                            child: ButtonsChallengeWidget.white(
                          label: "Pular",
                          onTap: nextPage,
                        )),
                        if(value == widget.questions.length)
                        SizedBox(
                          width: 7,
                        ),
                        if(value == widget.questions.length)
                        Expanded(
                            child: ButtonsChallengeWidget.green(
                          label: "Finalizar",
                          onTap: () {
                            Navigator.pop(context);
                          },
                        )),
                      ],
                    ))),
      ),
    );
  }
}
