import 'package:flutter/material.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  final bool isResponsive;
  final double width;

  const ResponsiveButton({
    Key? key,
    this.isResponsive = false,
    this.width = 200.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isResponsive ? width : null,
      height: 60.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.mainColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 6.0, right: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            SizedBox(width: 4.0),
            AppText(text: "Next", color: Colors.white),
            SizedBox(width: 4.0),
            Icon(
              Icons.arrow_right_alt_rounded,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
