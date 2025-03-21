import 'package:courses_eshop_app/common/widgets/search_widget.dart';
import 'package:courses_eshop_app/features/home_page/controller/home_controller.dart';
import 'package:courses_eshop_app/features/home_page/view/home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomeContentState();
}

class _HomeContentState extends ConsumerState<HomePage> {
  late PageController _controller;

  @override
  void didChangeDependencies() {
    _controller = PageController(initialPage: ref.watch(homeScreenBannerDotsProvider));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: HomeAppBarWidget(ref: ref),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.refresh(homeCourseListProvider.notifier);
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                const UserName(),
                SizedBox(height: 20.h),
                SearchWidget(
                  onSubmit: (val) {
                    ref.read(homeCourseListProvider.notifier).searchCourses(val);
                  },
                ),
                SizedBox(height: 20.h),
                HomeBannerWidget(ref: ref, controller: _controller),
                SizedBox(height: 20.h),
                HomeMenuBarWidget(),
                CoursesGridWidget(ref: ref),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
