import 'package:courses_eshop_app/common/widgets/app_bar.dart';
import 'package:courses_eshop_app/common/widgets/search_widget.dart';
import 'package:courses_eshop_app/features/search_page/controller/courses_search_controller.dart';
import 'package:courses_eshop_app/features/search_page/view/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchData = ref.watch(coursesSearchControllerProvider);

    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Search courses',
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          return ref.read(coursesSearchControllerProvider.notifier).reloadSearchData();
        },
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: SearchWidget(
                onSubmit: (val) {
                  ref.read(coursesSearchControllerProvider.notifier).searchData(val);
                },
              ),
            ),
            SizedBox(height: 20.h),
            switch (searchData) {
              AsyncData(:final value) => value.isEmpty
                  ? const Expanded(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: Text('No courses found'),
                        ),
                      ),
                    )
                  : SearchCoursesListWidget(value: value),
              AsyncError(:final error) => Text('Error $error'),
              _ => const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            }
          ],
        ),
      ),
    );
  }
}
