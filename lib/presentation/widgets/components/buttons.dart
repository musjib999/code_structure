import 'package:flutter/material.dart';

import '../widgets.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.buttonStyle,
    this.buttonTextStyle,
    this.isDisabled,
    this.height,
    this.width,
    this.margin,
    this.alignment,
  }) : super(
          key: key,
        );

  final String text;

  final VoidCallback? onPressed;

  final ButtonStyle? buttonStyle;

  final TextStyle? buttonTextStyle;

  final bool? isDisabled;

  final double? height;

  final double? width;

  final EdgeInsets? margin;

  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

class PrimaryButton extends BaseButton {
  const PrimaryButton({
    super.key,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    this.loading = false,
    EdgeInsets? margin,
    VoidCallback? onPressed,
    ButtonStyle? buttonStyle,
    Alignment? alignment,
    TextStyle? buttonTextStyle,
    bool? isDisabled,
    double? height,
    double? width,
    required String text,
    this.bgColor = AppColors.primaryColor,
  }) : super(
          text: text,
          onPressed: onPressed,
          buttonStyle: buttonStyle,
          isDisabled: isDisabled,
          buttonTextStyle: buttonTextStyle,
          height: height,
          width: width,
          alignment: alignment,
          margin: margin,
        );

  final BoxDecoration? decoration;

  final Widget? leftIcon;

  final Widget? rightIcon;
  final bool loading;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildElevatedButtonWidget,
          )
        : buildElevatedButtonWidget;
  }

  Widget get buildElevatedButtonWidget => Container(
        height: height ?? 44,
        width: width ?? double.maxFinite,
        margin: margin,
        decoration: decoration ??
            BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: bgColor,
            ),
        child: ElevatedButton(
          style: buttonStyle ??
              ElevatedButton.styleFrom(
                backgroundColor: bgColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
          onPressed: loading == true ? () {} : onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leftIcon ?? const SizedBox.shrink(),
              loading == true
                  ? loader(AppColors.white)
                  : Text(
                      text,
                      style: buttonTextStyle ?? AppTextStyle.buttonTitle,
                    ),
              rightIcon ?? const SizedBox.shrink(),
            ],
          ),
        ),
      );
}
