import 'package:chat_app/models/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String lable;
  final bool isPassword;
  final TextEditingController controller;
  var icon;

  CustomTextForm(
      {required this.lable,
      this.isPassword = false,
      required this.controller,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 22),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.kWhite, borderRadius: BorderRadius.circular(25)),
        child: TextFormField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
              fillColor: AppColors.kWhite,
              prefixIcon: icon,
              prefixIconColor: AppColors.kWhite,
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.kWhite),
                  borderRadius: BorderRadius.circular(25)),
              label: Text(
                '$lable',
              )),
        ),
      ),
    );
  }
}
