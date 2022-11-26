import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MainButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const MainButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 2.h),
        backgroundColor: Theme.of(context). primaryColor,
      ),
      onPressed: onPressed,
      child: Text(
        text,
      ),
    );
  }
}
