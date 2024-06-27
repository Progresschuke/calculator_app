import 'package:calculator_app/consts/app_colors.dart';
import 'package:calculator_app/consts/app_images.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/common_widgets.dart';

class SignUpSuccess extends StatelessWidget {
  const SignUpSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: Padding(
        padding: EdgeInsets.only(top: 15.h, left: 6.w, right: 6.w),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
              child: Image.asset(
                AppImages.signupSuccess,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8.h),
            // Text(
            //   'Congratulations',
            //   textAlign: TextAlign.center,
            //   style: TextStyle(
            //       color: AppColors.primaryBlack,
            //       fontSize: 4.3.h,
            //       fontWeight: FontWeight.w700),
            // ),
            // SizedBox(height: 4.7.h),
            // SizedBox(
            //   width: 70.w,
            //   child: Text(
            //     'Your email and account has been verified successfully.',
            //     textAlign: TextAlign.center,
            //     style: TextStyle(
            //       color: AppColors.grey400,
            //       fontSize: 2.5.h,
            //     ),
            //   ),
            // ),
            SizedBox(height: 4.h),
            appElevatedButton(
              text: 'Start Solving Equations',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
