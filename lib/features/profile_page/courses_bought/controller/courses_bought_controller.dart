import 'package:courses_eshop_app/features/profile_page/courses_bought/repo/courses_bought_repo.dart';
import 'package:courses_eshop_app/models/course.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'courses_bought_controller.g.dart';

@riverpod
class CoursesBoughtController extends _$CoursesBoughtController {
  @override
  FutureOr<List<CourseItem>?> build() async {
    final response = await CoursesBoughtRepo.coursesBought();

    if (response?.code == 200) {
      return response!.data;
    } else {
      if (kDebugMode) {
        print('Request failed with status code ${response?.code}');
      }
    }
    return null;
  }
}
