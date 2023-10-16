import 'package:flutter/material.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'This will generate a ',
        style: DefaultTextStyle.of(context).style,
        children: const [
          TextSpan(
            text: 'Visit Summary Document',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

Widget elevatedButtonWidget({
  required double width,
  required String text,
  required Color backgroundColor,
  required Color borderColor,
  required Color textColor,
  required VoidCallback onPressed,
}) {
  return SizedBox(
    width: width,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
          side: BorderSide(color: borderColor, width: 2),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: textColor,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  );
}
