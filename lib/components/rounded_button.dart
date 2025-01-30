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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: ElevatedButton(
          onPressed: press,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            backgroundColor: arkaplanrenkim,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Text(
            text,
            style: AppTextStyle.MIDDLE_BUTTON_TEXT,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
