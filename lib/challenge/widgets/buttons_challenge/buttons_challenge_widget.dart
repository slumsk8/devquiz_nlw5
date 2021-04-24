import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:DevQuiz/core/app_colors.dart';

class ButtonsChallengeWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;
  final Color overlayColor;
  final VoidCallback onTap;

  ButtonsChallengeWidget({
    Key? key,
    required this.label,
    required this.backgroundColor,
    required this.fontColor,
    required this.borderColor,
    required this.overlayColor,
    required this.onTap,
  }) : assert(["Pular", "Confirmar"].contains(label)),
        super(key: key);

  ButtonsChallengeWidget.white({required String label, required VoidCallback onTap})
      : this.backgroundColor = AppColors.white,
        this.fontColor = AppColors.grey,
        this.borderColor = AppColors.border,
        this.label = label,
        this.overlayColor = AppColors.lightGreen,
        this.onTap = onTap;
        

  ButtonsChallengeWidget.green({required String label, required VoidCallback onTap})
      : this.backgroundColor = AppColors.darkGreen,
        this.fontColor = AppColors.white,
        this.borderColor = AppColors.green,
        this.label = label,
        this.overlayColor = AppColors.levelButtonTextFacil,
        this.onTap = onTap;

  ButtonsChallengeWidget.purple({required String label, required VoidCallback onTap})
      : this.backgroundColor = AppColors.purple,
        this.fontColor = AppColors.white,
        this.borderColor = AppColors.purple,
        this.label = label,
        this.overlayColor = AppColors.levelButtonTextFacil,
        this.onTap = onTap;
  
  ButtonsChallengeWidget.transparent({required String label, required VoidCallback onTap})
      : this.backgroundColor = Colors.transparent,
        this.fontColor = AppColors.grey,
        this.borderColor = Colors.transparent,
        this.label = label,
        this.overlayColor = AppColors.levelButtonTextFacil,
        this.onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
          width: 164,
          height: 48,
          child: TextButton(
              style: ButtonStyle(
                  overlayColor: MaterialStateProperty.resolveWith(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered))
                        return overlayColor;
                      if (states.contains(MaterialState.focused) ||
                          states.contains(MaterialState.pressed))
                        return overlayColor;
                      return null;
                    },
                  ),
                  backgroundColor: MaterialStateProperty.all(backgroundColor),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                  side:
                      MaterialStateProperty.all(BorderSide(color: borderColor))),
              onPressed: onTap,
              child: Text(
                label,
                style: GoogleFonts.notoSans(
                  color: fontColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ))),
    );
  }
}
