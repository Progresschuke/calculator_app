import 'package:calculator_app/consts/app_colors.dart';
import 'package:calculator_app/consts/app_images.dart';
import 'package:calculator_app/views/auth/components/auth_tab.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AuthTabScreen extends StatefulWidget {
  const AuthTabScreen({super.key});

  @override
  State<AuthTabScreen> createState() => _AuthTabScreenState();
}

class _AuthTabScreenState extends State<AuthTabScreen> {
  late FocusNode curentFocusNode;
  late TextEditingController searchFieldController;
  bool isSearching = false;
  bool showHistory = false;

  @override
  void initState() {
    super.initState();
    curentFocusNode = FocusNode();
    searchFieldController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.appBackgroundColor,
        body: Stack(
          children: [
            Container(
              height: 100.h,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        AppImages.background,
                      ),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h, left: 4.w, right: 4.w),
              child: const AuthPagesWidget(),
            ),
          ],
        ));
  }
}
