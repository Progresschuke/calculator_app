import 'package:calculator_app/consts/app_colors.dart';
import 'package:calculator_app/consts/app_images.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SignInSuccess extends StatelessWidget {
  const SignInSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: Padding(
        padding: EdgeInsets.only(top: 15.h, left: 6.w, right: 6.w),
        child: Column(
          children: [
            SizedBox(
              height: 15.h,
              child: Image.asset(
                AppImages.success,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Login Successful!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  // fontFamily: 'Raleway',
                  color: AppColors.primaryBlack,
                  fontSize: 4.3.h,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 1.7.h),
            Text(
              'You have successfully logged in to your QuickSolver account.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w600,
                color: AppColors.grey400,
                fontSize: 2.3.h,
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              width: 60.w,
              height: 1.5.h,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: AppColors.primaryGreen,
                  ),
                  borderRadius: BorderRadius.circular(3.w)),
            ),
            SizedBox(height: 1.h),
            Text(
              'Wait while we personalize your\n experience for you.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w600,
                color: AppColors.grey900,
                fontSize: 1.7.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
