import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/app_colors.dart';
import 'my__text.dart';

class SenderMassage extends StatelessWidget {
  String massage;
  String dateTime;
  SenderMassage({required this.massage, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: AppColors.kGreen,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
                bottomLeft: Radius.circular(10.r),
              ),
            ),
            child: MyText(text: massage),
          ),
          SizedBox(
            height: 5.h,
          ),
          SizedBox(
            width: 60.w,
            child: MyText(
              text: dateTime,
              maxLines: 1,
              textOverflow: TextOverflow.clip,
              fontSize: 10.sp,
            ),
          )
        ],
      ),
    );
  }
}
