import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/app_colors.dart';

class CustomButton extends StatelessWidget {
  var color;
  String text;
  var function;
  var weight;
  var hight;
  CustomButton({
    required this.hight,
    required this.weight,
    required this.color,
    required this.text,
    this.function,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: weight,
        height: hight,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: color),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.kWhite),
          ),
        ),
      ),
    );
  }
}
