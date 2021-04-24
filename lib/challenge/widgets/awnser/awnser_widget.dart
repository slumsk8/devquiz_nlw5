import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/widgets/models/awnser_model.dart';
import 'package:flutter/material.dart';

class AwnserWidget extends StatelessWidget {
  final AwnserModel awnser;
  final bool isSelcted;
  final bool disabled;
  final ValueChanged<bool> onTap;

  const AwnserWidget(
      {Key? key,
      this.disabled = false,      
      required this.awnser,
      required this.onTap,
      this.isSelcted = false})
      : super(key: key);

  // GETS para verificação das respostas do quiz
  Color get _selectedColorRigth =>
      awnser.isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRigth =>
      awnser.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRigth =>
      awnser.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRigth =>
      awnser.isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRigth =>
      awnser.isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => awnser.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Center(
        child: IgnorePointer(
          ignoring: disabled,
          child: GestureDetector(
            onTap: (){
              onTap(awnser.isRight);
            },
            child: Container(
              height: 72,
              width: 335,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isSelcted ? _selectedColorCardRigth : AppColors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.fromBorderSide(BorderSide(
                    color: isSelcted
                        ? _selectedBorderCardRigth
                        : AppColors.border)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      awnser.title,
                      style: isSelcted
                          ? _selectedTextStyleRigth
                          : AppTextStyles.body,
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
        ),
      ),
    );
  }
}
