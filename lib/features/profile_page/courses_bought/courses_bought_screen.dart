import 'package:courses_eshop_app/common/widgets/app_bar.dart';
import 'package:courses_eshop_app/features/profile_page/courses_bought/controller/courses_bought_controller.dart';
import 'package:courses_eshop_app/features/profile_page/courses_bought/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoursesBoughtScreen extends ConsumerWidget {
  static const kRoute = '/bought-courses';

  const CoursesBoughtScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coursesList = ref.watch(coursesBoughtControllerProvider);
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Your courses',
      ),
      body: switch (coursesList) {
        AsyncData(:final value) => value == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : CoursesBoughtWidget(items: value),
        AsyncError(:final error) => Text('Error $error'),
        _ => const Center(
            child: CircularProgressIndicator(),
          )
      },
    );
  }
}
