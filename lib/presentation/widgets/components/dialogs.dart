import 'package:flutter/material.dart';

import '../themes/colors.dart';

enum Status { success, error }

extension StatusX on Status {
  bool get isSuccess => this == Status.success;
  bool get isError => this == Status.error;
}

void showSnackbar(BuildContext context, Status status,
    {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      width: MediaQuery.of(context).size.width > 600
          ? MediaQuery.of(context).size.width * 0.25
          : double.infinity,
      backgroundColor: status.isSuccess ? AppColors.success : AppColors.error,
      behavior: SnackBarBehavior.floating,
      content: Text(message),
      duration: const Duration(seconds: 3),
    ),
  );
}

Future<DateTime?> selectDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime(2101),
  );
  if (picked != null) {
    return picked;
  } else {
    return null;
  }
}

Future<TimeOfDay?> selectTime(BuildContext context) async {
  final TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );
  if (picked != null) {
    return picked;
  } else {
    return null;
  }
}

void showPopUpDialog(BuildContext context, {required Widget child}) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: child,
      );
    },
  );
}

void showInformationPopUp(BuildContext context,
    {required String title,
    required String info,
    required void Function()? onYes}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(info),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'No',
                style: TextStyle(color: AppColors.primaryColor),
              ),
            ),
            TextButton(
              onPressed: onYes,
              child: const Text(
                'Yes',
                style: TextStyle(color: AppColors.primaryColor),
              ),
            )
          ],
        );
      });
}

bool validateEmail(String email) {
  String pattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(email);
}

String? validateTextField(String? value) {
  if (value == null || value.isEmpty) {
    return 'Field is required';
  } else {
    return null;
  }
}

CircularProgressIndicator loader(Color color) {
  return CircularProgressIndicator(
    color: color,
  );
}
