import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MyBaseViewModel extends BaseViewModel {
  late BuildContext viewContext;

  void initialise() {}

  toastError(String msg) {
    BotToast.showSimpleNotification(
      title: '',
      subTitle: msg,
      duration: const Duration(seconds: 2),
      subTitleStyle: const TextStyle(
        color: Colors.red,
      ),
      crossPage: true,
      enableKeyboardSafeArea: true,
    );
  }
}
