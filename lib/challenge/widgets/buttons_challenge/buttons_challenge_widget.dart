import 'package:DevQuiz/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonsChallengeWidget extends StatelessWidget {
  final String label;

  ButtonsChallengeWidget({
    Key? key,
    required this.label,
  })   : assert(["Pular", "Confirmar"].contains(label)),
        super(key: key);

  final styleButtons = {
    "Pular": {
      "color": Colors.white,
      "borderColor": AppColors.border,
      "fontColor": AppColors.grey
    },
    "Confirmar": {
      "color": Colors.green,
      "borderColor": AppColors.green,
      "fontColor": AppColors.white
    },
  };

  Color get color => styleButtons[label]!['color']!;
  Color get borderColor => styleButtons[label]!['borderColor']!;
  Color get fontColor => styleButtons[label]!['fontColor']!;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 164,
        height: 48,
        // decoration: BoxDecoration(
        //   color: color,
        //   border: Border.fromBorderSide(BorderSide(
        //     color: borderColor,
        //   )),
        //   borderRadius: BorderRadius.circular(10),
        // ),
        child: TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(color),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
                side:
                    MaterialStateProperty.all(BorderSide(color: borderColor))),
            onPressed: () {},
            child: Text(
              label,
              style: GoogleFonts.notoSans(
                color: fontColor,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            )));
  }
}
