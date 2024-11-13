import 'package:courses_eshop_app/common/widgets/app_bar.dart';
import 'package:courses_eshop_app/common/widgets/search_widget.dart';
import 'package:courses_eshop_app/features/home/controller/home_controller.dart';
import 'package:courses_eshop_app/features/home/view/home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeContent extends ConsumerStatefulWidget {
  const HomeContent({super.key});

  @override
  ConsumerState<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends ConsumerState<HomeContent> {
  late PageController _controller;

  @override
  void didChangeDependencies() {
    _controller = PageController(initialPage: ref.watch(homeScreenBannerDotsProvider));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Home'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              const UserName(),
              SizedBox(height: 20.h),
              searchWidget(),
              SizedBox(height: 20.h),
              HomeBannerWidget(ref: ref, controller:  _controller),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
