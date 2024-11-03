import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastVariant {
  info,
  error,
  success,
}

toastInfo(
  String message, {
  ToastVariant variant = ToastVariant.info,
}) {
  late Color _textColor;
  late Color _bg;

  switch (variant) {
    case ToastVariant.info:
      _textColor = Colors.black;
      _bg = Colors.blue;
      break;
    case ToastVariant.error:
      _textColor = Colors.black;
      _bg = Colors.blue;
      break;
    case ToastVariant.success:
      _textColor = Colors.black;
      _bg = Colors.blue;
      break;
  }

  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 2,
    backgroundColor: Colors.blue,
    textColor: Colors.black,
    fontSize: 16,
  );
}
