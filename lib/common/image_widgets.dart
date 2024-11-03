import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';

Widget appImage({
  String? img,
  double width = 16,
}) {
  return Image.asset(
    img ?? Assets.icons.user.path,
    width: width,
  );
}
