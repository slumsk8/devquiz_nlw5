import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class AwnserWidget extends StatelessWidget {
  final String title;
  final bool isRight;
  final bool isSelcted;

  const AwnserWidget(
      {Key? key,
      required this.title,
      this.isRight = false,
      this.isSelcted = false})
      : super(key: key);

  // GETS para verificação das respostas do quiz
  Color get _selectedColorRigth =>
      isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRigth =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRigth =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRigth =>
      isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRigth =>
      isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Center(
        child: Container(
          height: 72,
          width: 335,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isSelcted ? _selectedColorCardRigth : AppColors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.fromBorderSide(BorderSide(
                color:
                    isSelcted ? _selectedBorderCardRigth : AppColors.border)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style:
                      isSelcted ? _selectedTextStyleRigth : AppTextStyles.body,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: isSelcted ? _selectedColorRigth : AppColors.white,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.fromBorderSide(
                    BorderSide(
                        color: isSelcted
                            ? _selectedBorderRigth
                            : AppColors.border),
                  ),
                ),
                height: 24,
                width: 24,
                child: isSelcted
                    ? Icon(
                        _selectedIconRight,
                        color: AppColors.white,
                        size: 16,
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
