import 'package:DevQuiz/challenge/challenge_controller.dart';
import 'package:DevQuiz/result/result_page.dart';
import 'package:flutter/material.dart';

import 'package:DevQuiz/challenge/widgets/buttons_challenge/buttons_challenge_widget.dart';
import 'package:DevQuiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:DevQuiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:DevQuiz/shared/widgets/models/question_model.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;
  const ChallengePage({
    Key? key,
    required this.questions,
    required this.title,
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

  void onSelected(bool value)  {
    if(value){
      controller.contRigth++;
    }
    nextPage();
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
                  onSelected: onSelected,
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
                        // se a pagina atual for menor que a quantidade de questions o botao pular nao aparece.
                        if (value < widget.questions.length)
                          Expanded(
                              child: ButtonsChallengeWidget.white(
                            label: "Pular",
                            onTap: nextPage,
                          )),
                        if (value == widget.questions.length)
                          SizedBox(
                            width: 7,
                          ),
                        if (value == widget.questions.length)
                          Expanded(
                              child: ButtonsChallengeWidget.green(
                            label: "Finalizar",
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (contex) => ResultPage(
                                        resultRight: controller.contRigth,
                                        title: widget.title,
                                        length: widget.questions.length,
                                      )));
                            },
                          )),
                      ],
                    ))),
      ),
    );
  }
}
