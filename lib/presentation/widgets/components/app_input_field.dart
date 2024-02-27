import 'package:flutter/material.dart';

import '../themes/colors.dart';

class AppInputField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String hintText;
  final String? errorText;
  final IconData? prefixIcon;
  final Widget? suffix;
  final bool obscureText;
  final AutovalidateMode? autovalidateMode;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool? enabled;
  final bool readOnly;
  const AppInputField({
    super.key,
    required this.controller,
    required this.hintText,
    this.errorText,
    this.prefixIcon,
    this.suffix,
    this.obscureText = false,
    this.onChanged,
    this.validator,
    this.autovalidateMode,
    this.keyboardType,
    this.maxLength,
    this.enabled,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextFormField(
        enabled: enabled,
        readOnly: readOnly,
        controller: controller,
        onChanged: onChanged,
        validator: validator,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          errorText: errorText,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: AppColors.ash,
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: AppColors.ash,
            ),
          ),
          suffix: suffix,
        ),
        maxLength: maxLength,
        obscureText: obscureText,
        autovalidateMode: autovalidateMode,
      ),
    );
  }
}

class AppTextArea extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final TextInputType keyboardType;
  final Function(String)? onChanged;

  const AppTextArea({
    Key? key,
    required this.controller,
    this.hintText = '',
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      onChanged: onChanged,
      decoration: InputDecoration(
          fillColor: AppColors.grey,
          filled: true,
          hintText: hintText,
          border: InputBorder.none,
          enabledBorder: InputBorder.none),
    );
  }
}

class ClickableInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final Function()? onTap;

  const ClickableInputField({
    Key? key,
    required this.icon,
    required this.hintText,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: AppColors.grey,
        child: Row(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
              decoration: const BoxDecoration(color: AppColors.primaryColor),
              child: Icon(icon, color: AppColors.white),
            ),
            const SizedBox(width: 10.0),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
              child: Text(
                hintText,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppDropdown extends StatelessWidget {
  final List<String> items;
  final String? hintText;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;

  const AppDropdown({
    super.key,
    required this.items,
    this.onChanged,
    this.hintText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: items.map((String value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.grey, // Grey filled color
        hintText: hintText ?? 'Select an option', // Set default hint text
        border: InputBorder.none, // Remove outline border
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12.0), // Adjust padding
      ),
      onChanged: onChanged,
    );
  }
}
