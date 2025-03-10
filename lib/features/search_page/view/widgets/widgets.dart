import 'package:courses_eshop_app/common/widgets/course_tile_widget.dart';
import 'package:courses_eshop_app/models/course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchCoursesListWidget extends ConsumerWidget {
  final List<CourseItem> value;

  const SearchCoursesListWidget({super.key, required this.value});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
        child: ListView(
      children: [
        for (final val in value) CourseTileWidget(item: val),
      ],
    ));
  }
}
