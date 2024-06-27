import 'package:calculator_app/consts/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class InputFormBox extends StatelessWidget {
  const InputFormBox({
    super.key,
    this.hintText,
    this.textInputType,
    this.minLines,
    this.maxLines,
    this.helperText,
    this.fillColor,
    this.suffixIcon,
    this.width,
    this.showBorder = true,
    this.obscureText = false,
  });

  final String? hintText;
  final TextInputType? textInputType;
  final int? minLines;
  final int? maxLines;
  final Color? fillColor;
  final String? helperText;
  final Widget? suffixIcon;
  final bool showBorder;
  final bool obscureText;
  final double? width;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        // SizedBox(height: 1 * size.height / 100),
        SizedBox(
          width: width ?? 100 * size.width / 100,
          height: 6.h,
          child: TextField(
            style: const TextStyle(
                color: Colors.black54, fontWeight: FontWeight.w500),
            minLines: minLines,
            maxLines: maxLines ?? 1,
            keyboardType: textInputType ?? TextInputType.name,
            obscureText: obscureText,
            // controller: firstnameController,s
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              helperText: helperText,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3.w),
                borderSide:
                    const BorderSide(color: AppColors.primaryGreen, width: 1.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3.w),
                borderSide: showBorder
                    ? const BorderSide(
                        color: AppColors.primaryGreen, width: 1.0)
                    : BorderSide.none,
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 1.5.h,
                fontWeight: FontWeight.w300,
                color: Colors.grey,
              ),
              filled: true,
              fillColor: fillColor ?? Colors.white,
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 3.h),
            ),
          ),
        ),
      ],
    );
  }
}

Widget appElevatedButton(
    {String? text,
    void Function()? onTap,
    Color? backgroundColor,
    Color? foregroundColor,
    String? fontFamily,
    double? fontSize,
    Widget? child,
    double? width,
    double? elevation,
    bool showBorder = false,
    double? height}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: Size(width ?? 100.w, height ?? 5.5.h),
          elevation: elevation ?? 0,
          shape: ContinuousRectangleBorder(
              side: showBorder
                  ? const BorderSide(color: AppColors.primaryGreen, width: 1)
                  : BorderSide.none,
              borderRadius: BorderRadius.circular(8.w)),
          backgroundColor: backgroundColor ?? AppColors.primaryGreen,
          foregroundColor: foregroundColor ?? AppColors.primaryWhite),
      onPressed: onTap,
      child: text == null
          ? child
          : Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: fontFamily ?? 'Raleway',
                  fontSize: fontSize ?? 2.3.h),
            ));
}
