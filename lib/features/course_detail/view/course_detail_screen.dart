import 'package:courses_eshop_app/common/widgets/app_bar.dart';
import 'package:courses_eshop_app/features/course_detail/controller/course_controller.dart';
import 'package:courses_eshop_app/features/course_detail/view/widgets/course_detail_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseDetailScreen extends ConsumerStatefulWidget {
  static const kRoute = '/course-detail';

  const CourseDetailScreen({super.key});

  @override
  ConsumerState<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends ConsumerState<CourseDetailScreen> {
  late int id;

  @override
  void didChangeDependencies() {
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    id = args['id'];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var stateData = ref.watch(courseDetailControllerProvider(id: id));
    var lessonsData = ref.watch(courseLessonsControllerProvider(id: id));
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Course detail',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 25.w),
            stateData.when(
              data: (data) {
                return data == null
                    ? const SizedBox()
                    : Column(
                        children: [
                          CourseDetailThumbnailWidget(data: data),
                          SizedBox(height: 8.h),
                          CourseDetailInfoRowWidget(courseItem: data),
                          CourseDetailDescriptionWidget(courseItem: data),
                          SizedBox(height: 20.h),
                          GoBuyButtonWidget(courseItem: data),
                          SizedBox(height: 20.h),
                          CourseDetailIncludesWidget(courseItem: data),
                        ],
                      );
              },
              error: (error, stackTrace) => const Text('Error loading data'),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            lessonsData.when(
              data: (data) => data == null ? const SizedBox() : LessonInfoWidget(lessons: data, ref: ref),
              error: (Object error, StackTrace stackTrace) {
                return const SizedBox();
              },
              loading: () {
                return const SizedBox();
              },
            ),
            SizedBox(height: 40.w),
          ],
        ),
      ),
    );
  }
}
