import 'package:courses_eshop_app/common/app_box_shadow.dart';
import 'package:courses_eshop_app/common/image_widgets.dart';
import 'package:courses_eshop_app/common/utils/app_colors.dart';
import 'package:courses_eshop_app/common/widgets/app_textfield.dart';
import 'package:courses_eshop_app/features/search_page/controller/courses_search_controller.dart';
import 'package:courses_eshop_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchWidget extends StatefulWidget {
  final Function(String val)? onSubmit;

  const SearchWidget({super.key, this.onSubmit});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 40.h,
            decoration: appBoxDecoration(
              color: AppColors.primaryBackground,
              boxBorder: Border.all(
                color: AppColors.primaryFourElementText,
              ),
            ),
            child: Row(
              children: [
                SizedBox(width: 15.w),
                AppImageWidget(
                  img: Assets.icons.search.path,
                  width: 20.w,
                ),
                Expanded(
                  child: AppTextfieldOnlyWidget(
                    controller: controller,
                    textInputAction: TextInputAction.search,
                    onSubmit: widget.onSubmit != null ? (val) => widget.onSubmit!(val) : null,
                    height: 40,
                    hint: 'Search courses...',
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 15.w),
        GestureDetector(
          onTap: widget.onSubmit != null
              ? () {
                  widget.onSubmit!(controller.text);
                }
              : null,
          child: Container(
            width: 40.h,
            height: 40.h,
            decoration: appBoxDecoration(),
            child: Center(
              child: AppImageWidget(width: 24, img: Assets.icons.search.path),
            ),
          ),
        )
      ],
    );
  }
}
