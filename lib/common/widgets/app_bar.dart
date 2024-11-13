import 'package:courses_eshop_app/common/utils/app_colors.dart';
import 'package:courses_eshop_app/common/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarWidget({super.key, this.title = ''});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: text16Normal(
        title,
        color: AppColors.primaryText,
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(10),
        child: Container(
          height: 1,
          color: Colors.grey.withOpacity(0.3),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
