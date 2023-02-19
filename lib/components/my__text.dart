import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/app_colors.dart';

class MyText extends StatelessWidget {
  String text;
  var fontSize;
  TextAlign? textAlign;
  FontWeight? fontWeight;
  TextOverflow? textOverflow;
  int? maxLines;
  MyText(
      {required this.text,
      this.fontSize,
      this.fontWeight,
      this.textAlign,
      this.maxLines,
      this.textOverflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: textOverflow,
      style: TextStyle(
          color: AppColors.kWhite,
          fontSize: fontSize ?? 18.sp,
          fontWeight: fontWeight ?? FontWeight.normal),
      textAlign: textAlign,
    );
  }
}
