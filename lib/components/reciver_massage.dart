import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/app_colors.dart';
import 'my__text.dart';

class ReciverMassage extends StatelessWidget {
  String? massage;
  String dateTime;
  ReciverMassage({required this.massage, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: AppColors.kOrange,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
                bottomRight: Radius.circular(10.r),
              ),
            ),
            child: MyText(text: massage!),
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
