import 'package:flutter/material.dart';
import 'package:flutter_app/core/app_text_style.dart';
import 'package:flutter_app/core/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press; 
  const RoundedButton({
    super.key,
    required this.text,
    required this.press, 
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10), 
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: TextButton(
          onPressed: press,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
                vertical: 10, horizontal: 15), 
            backgroundColor:
                arkaplanrenkim, 
          ),
          child: Text(
            text,
            style: AppTextStyle
                .MIDDLE_BUTTON_TEXT, 
          ),
        ),
      ),
    );
  }
}
