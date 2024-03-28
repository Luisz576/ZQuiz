import 'package:flutter/material.dart';
import 'package:zquiz/interactor/entity/question_entity.dart';
import 'package:zquiz/ui/theme/zquiz_colors.dart';
import 'package:zquiz/ui/theme/zquiz_dimensions.dart';

class QuestionOptionTile extends StatelessWidget {
  final OptionQuestion option;
  final bool marked, canMark;
  final Function() onPressed;
  const QuestionOptionTile({
    required this.option,
    required this.marked,
    required this.canMark,
    required this.onPressed,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    IconData iconData;
    Color iconColor;
    if(marked){
      if(option.correctAnswer){
        iconData = Icons.swap_vert_circle;
        iconColor = ZQuizColors.primaryColor;
      }else{
        iconData = Icons.remove_circle;
        iconColor = ZQuizColors.errorColor;
      }
    }else{
      iconData = Icons.circle;
      iconColor = ZQuizColors.whiteColor;
    }
    return GestureDetector(
      onTap: canMark ? onPressed : null,
      child: Card(
        color: marked ? ZQuizColors.grayColor : ZQuizColors.lightGrayColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: ZquizDimensions.smallPadding,
            vertical: ZquizDimensions.tinyPadding
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Text(option.text,
                  style: TextStyle(
                    color: marked ? ZQuizColors.whiteColor : ZQuizColors.blackColor,
                  ),
                )
              ),
              Icon(iconData,
                color: iconColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
