import 'package:courses_eshop_app/common/image_widgets.dart';
import 'package:courses_eshop_app/common/utils/constants.dart';
import 'package:courses_eshop_app/common/widgets/text_widgets.dart';
import 'package:courses_eshop_app/features/profile_page/controller/profile_controller.dart';
import 'package:courses_eshop_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
      var profile = ref.watch(profileControllerProvider);

      return Container(
        alignment: Alignment.bottomRight,
        width: 80.w,
        height: 80.w,
        decoration: profile.avatar == null
            ? BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.images.defaultimg.path),
                ),
              )
            : BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(getUploadedFileUrl(profile.avatar!)),
                ),
              ),
        child: AppImageWidget(
          width: 25.w,
          height: 25.w,
          img: Assets.icons.edit3.path,
        ),
      );
    });
  }
}

class ProfileNameWidget extends StatelessWidget {
  const ProfileNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
      var profile = ref.watch(profileControllerProvider);

      return Container(
        margin: const EdgeInsets.only(top: 12),
        child: Text13Normal(profile.name != null ? profile.name! : ''),
      );
    });
  }
}
