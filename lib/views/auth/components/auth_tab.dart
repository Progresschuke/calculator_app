import 'package:calculator_app/consts/app_images.dart';
import 'package:calculator_app/views/auth/components/signin_tab.dart';
import 'package:calculator_app/views/auth/components/signup_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../consts/app_colors.dart';
import '../../../providers/common_provider.dart';

class AuthPagesWidget extends StatefulWidget {
  const AuthPagesWidget({
    super.key,
  });

  @override
  State<AuthPagesWidget> createState() => _AuthPagesWidgetState();
}

class _AuthPagesWidgetState extends State<AuthPagesWidget> {
  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CommonProvider>(
      builder: (context, commonProvider, child) {
        final currentPage = commonProvider.currenTabPageIndex;
        bool isFirstPageSelected = currentPage == 0;

        return PopScope(
          onPopInvoked: (didPop) {
            commonProvider.reseTabPageIndex();
          },
          child: SizedBox(
            height: 80.h,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        commonProvider.seTabPageIndex(0);
                        _controller.jumpToPage(0);
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            height: 3.h,
                            child: SvgPicture.asset(
                              AppImages.signinIcon,
                              colorFilter: ColorFilter.mode(
                                  isFirstPageSelected
                                      ? AppColors.primaryGreen
                                      : AppColors.grey400,
                                  BlendMode.srcIn),
                            ),
                          ),
                          SizedBox(width: 2.w),
                          Text(
                            'Sign up',
                            style: TextStyle(
                                color: isFirstPageSelected
                                    ? AppColors.primaryGreen
                                    : AppColors.grey400,
                                fontSize: 2.3.h),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 30.w),
                    GestureDetector(
                      onTap: () {
                        commonProvider.seTabPageIndex(1);
                        _controller.jumpToPage(1);
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            height: 3.h,
                            child: SvgPicture.asset(
                              AppImages.signinIcon,
                              colorFilter: ColorFilter.mode(
                                  !isFirstPageSelected
                                      ? AppColors.primaryGreen
                                      : AppColors.grey400,
                                  BlendMode.srcIn),
                            ),
                          ),
                          SizedBox(width: 2.w),
                          Text(
                            'Sign in',
                            style: TextStyle(
                                color: !isFirstPageSelected
                                    ? AppColors.primaryGreen
                                    : AppColors.grey400,
                                fontSize: 2.3.h),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: isFirstPageSelected,
                      child: Padding(
                        padding: EdgeInsets.only(left: 1.w),
                        child: Container(
                          alignment: Alignment.center,
                          width: 30.w,
                          height: .5.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.w),
                              color: AppColors.primaryGreen),
                        ),
                      ),
                    ),
                    SizedBox(width: 50.w),
                    Visibility(
                      visible: !isFirstPageSelected,
                      child: Padding(
                        padding: EdgeInsets.only(left: 1.w),
                        child: Container(
                          alignment: Alignment.center,
                          width: 30.w,
                          height: .5.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.w),
                              color: AppColors.primaryGreen),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Expanded(
                  child: PageView(
                    onPageChanged: (value) {
                      commonProvider.seTabPageIndex(value);
                    },
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _controller,
                    children: const [SignUpTab(), SignInTab()],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
