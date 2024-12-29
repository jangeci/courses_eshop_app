import 'package:courses_eshop_app/features/buy_course/repo/buy_course_repo.dart';
import 'package:courses_eshop_app/models/course.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'buy_course_controller.g.dart';

@riverpod
Future<String?> buyCourseController(Ref ref, {required int id}) async {
  CourseRequestEntity courseRequestEntity = CourseRequestEntity(id: id);

  final response = await BuyCourseRepo.buyCourse(params: courseRequestEntity);
  if (response?.code == 200) {
    return response!.data;
  } else {
    print('request failed due to ${response?.msg}');
    print('request failed ${response?.code}');
  }

  return null;
}
