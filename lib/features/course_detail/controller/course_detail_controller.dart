import 'package:courses_eshop_app/features/course_detail/repo/course_detail_repo.dart';
import 'package:courses_eshop_app/models/course.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'course_detail_controller.g.dart';

@riverpod
Future<CourseItem?> courseDetailController(Ref ref, {required int id}) async {
  CourseRequestEntity courseRequestEntity = CourseRequestEntity();
  courseRequestEntity.id = id;
  final response = await CourseDetailRepo.courseDetail(params: courseRequestEntity);

  if (response?.code == 200) {
    return response!.data;
  } else {
    print('requrest failed ${response?.code}');
  }
  return null;
}
