import 'package:courses_eshop_app/common/app_box_shadow.dart';
import 'package:courses_eshop_app/common/image_widgets.dart';
import 'package:courses_eshop_app/common/utils/app_colors.dart';
import 'package:courses_eshop_app/common/utils/constants.dart';
import 'package:courses_eshop_app/common/widgets/text_widgets.dart';
import 'package:courses_eshop_app/features/lesson_detail/controller/lesson_detail_controller.dart';
import 'package:courses_eshop_app/gen/assets.gen.dart';
import 'package:courses_eshop_app/models/lesson_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LessonVideosWidget extends StatelessWidget {
  final List<VideoItem> items;
  final Function(int i) playVideo;

  const LessonVideosWidget({
    super.key,
    this.items = const [],
    required this.playVideo,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        VideoItem thisItem = items[index];
        return Container(
          margin: EdgeInsets.only(bottom: 20.h),
          width: 325.w,
          constraints: BoxConstraints(
            minHeight: 80.h,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 8.h,
          ),
          decoration: appBoxDecoration(
            sR: 2,
            bR: 3,
            radius: 10,
            color: Colors.white,
          ),
          child: InkWell(
            onTap: () {
              playVideo(index);
            },
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      AppBoxDecorationImage(
                        imagePath: getUploadedFileUrl(thisItem.thumbnail ?? '/defaultimg.png'),
                        width: 60.w,
                        height: 60.w,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text14Normal(
                              thisItem.name ?? '',
                              color: AppColors.primaryText,
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        ),
                      ),
                      AppImageWidget(
                        img: Assets.icons.arrowRight.path,
                        width: 24,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
