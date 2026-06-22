import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key, this.label, this.onTap});

  final String? label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 25.vmin,
        height: 7.5.vmin,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue.shade800,
                  Colors.blue.shade300
                ]
            ),
          borderRadius: BorderRadius.circular(2.5.vmin)
        ),
        alignment: Alignment.center,
        child: Text(label ?? "Submit",
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.white
        ),
        ),
      ),
    );
  }
}
