import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

DateTime? _firstTouchTime;
DateTime? _secondTouchTime;

Future<bool> onBackPressed() async {
  if (_firstTouchTime == null) {
    Fluttertoast.showToast(msg: 'Click the back button again to end.');
    _firstTouchTime = DateTime.now();
  } else {
    _secondTouchTime = DateTime.now();
    if (_secondTouchTime!.difference(_firstTouchTime!).inSeconds <= 2) {
      SystemNavigator.pop();
    } else {
      Fluttertoast.showToast(msg: 'Click the back button again to end.');
      _firstTouchTime = DateTime.now();
    }
  }
  return false;
}

extension DateTimeExtension on DateTime {
  String toFullDateTimeString() {
    return DateFormat('yyyy.MM.dd a hh:mm', 'en_US').format(toLocal());
  }

  String toYearMonthDayString() {
    return DateFormat('yyyyMMdd', 'en_US').format(toLocal());
  }

  String toMonthDayString() {
    return DateFormat('MM.dd', 'en_US').format(toLocal());
  }
}

extension ListExtension<T> on List<T> {
  List<R> mapWithIndex<R>(R Function(T value, int index) callback) {
    List<R> result = [];
    for (int i = 0; i < length; i++) {
      R item = callback(this[i], i);
      result.add(item);
    }
    return result;
  }
}

Widget adaptiveAction({required BuildContext context, required VoidCallback onPressed, required Widget child}) {
  final ThemeData theme = Theme.of(context);
  switch (theme.platform) {
    case TargetPlatform.android:
    case TargetPlatform.fuchsia:
    case TargetPlatform.linux:
    case TargetPlatform.windows:
      return TextButton(onPressed: onPressed, child: child);
    case TargetPlatform.iOS:
    case TargetPlatform.macOS:
      return CupertinoDialogAction(onPressed: onPressed, child: child);
  }
}