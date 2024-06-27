import 'package:flutter/material.dart';
import 'package:calculator_app/consts/app_images.dart';
import 'package:calculator_app/utils/common_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../consts/app_colors.dart';
import '../../../providers/common_provider.dart';
import '../screens/signup_success.dart';

class SignUpTab extends StatelessWidget {
  const SignUpTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CommonProvider>(builder: (context, commonProvider, child) {
      bool rememberMe = commonProvider.rememberMe;
      final ValueNotifier<bool> toggleVisibility = ValueNotifier(true);
      return ValueListenableBuilder(
          valueListenable: toggleVisibility,
          builder: (context, isVisible, child) {
            return Padding(
              padding: EdgeInsets.only(top: 3.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'Kindly create an account to help us save your solutions for you.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.grey900,
                        fontSize: 2.3.h,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InputFormBox(
                          width: 45.w,
                          fillColor: AppColors.lightGreen,
                          hintText: 'First Name',
                          showBorder: false,
                        ),
                        InputFormBox(
                          width: 45.w,
                          fillColor: AppColors.lightGreen,
                          hintText: 'Last Name',
                          showBorder: false,
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    const InputFormBox(
                      textInputType: TextInputType.number,
                      fillColor: AppColors.lightGreen,
                      hintText: 'Phone Number',
                      showBorder: false,
                    ),
                    SizedBox(height: 2.h),
                    const InputFormBox(
                      fillColor: AppColors.lightGreen,
                      textInputType: TextInputType.emailAddress,
                      hintText: 'Email Address',
                      showBorder: false,
                    ),
                    SizedBox(height: 2.h),
                    InputFormBox(
                        hintText: 'Password',
                        obscureText: isVisible ? false : true,
                        showBorder: true,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            toggleVisibility.value = !toggleVisibility.value;
                          },
                          child: isVisible
                              ? const Icon(
                                  Icons.visibility_outlined,
                                  color: AppColors.primaryGreen,
                                )
                              : Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 1.h, horizontal: 2.h),
                                  child: SvgPicture.asset(AppImages.hideIcon)),
                        )),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        Checkbox(
                          hoverColor: Colors.red,
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(2.w)),
                          activeColor: AppColors.primaryGreen,
                          value: rememberMe,
                          onChanged: (value) {
                            commonProvider.setRememberMe(value!);
                          },
                        ),
                        SizedBox(height: 3.h),
                        Expanded(
                          child: Text(
                            'By Clicking “Sign up” You Agree to our Terms  of Use, Privacy Policy and the Cookie Policy.',
                            style: TextStyle(
                                fontSize: 1.7.h, color: AppColors.grey400),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.2.h),
                    appElevatedButton(
                      text: 'Sign up now',
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const SignUpSuccess(),
                            transitionDuration:
                                const Duration(milliseconds: 1000),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              var begin = const Offset(1.0, 0.0);
                              var end = Offset.zero;
                              var curve = Curves.ease;
                              var tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));

                              return SlideTransition(
                                  position: animation.drive(tween),
                                  child: child);
                            },
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 3.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppImages.dividerLeftIcon),
                        SizedBox(width: 3.w),
                        Text(
                          'or continue with',
                          style: TextStyle(
                              fontSize: 1.7.h, color: AppColors.grey400),
                        ),
                        SizedBox(width: 3.w),
                        SvgPicture.asset(AppImages.dividerRightIcon),
                      ],
                    ),
                    SizedBox(height: 4.5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppImages.gmailIcon),
                        SizedBox(width: 4.w),
                        SvgPicture.asset(AppImages.facebookIcon),
                        SizedBox(width: 4.w),
                        SvgPicture.asset(AppImages.appleIcon)
                      ],
                    ),
                    SizedBox(height: 5.5.h),
                    GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Continue as guest',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            decoration: TextDecoration.underline,
                            fontSize: 1.6.h,
                            color: AppColors.grey400,
                          ),
                        )),
                  ],
                ),
              ),
            );
          });
    });
  }
}
