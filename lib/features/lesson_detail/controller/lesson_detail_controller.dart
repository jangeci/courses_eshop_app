import 'package:courses_eshop_app/features/lesson_detail/repo/lesson_repo.dart';
import 'package:courses_eshop_app/models/lesson_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lesson_detail_controller.g.dart';

@riverpod
Future<LessonModel?> lessonDetailController(Ref ref, {required int id}) async {
  LessonRequestEntity lessonRequestEntity = LessonRequestEntity(id: id);
  final response = await LessonRepo.lessonDetail(params: lessonRequestEntity);

  if (response?.code == 200) {
    return response!.data;
  } else {
    print('Lesson detail request failed ${response?.code}');
  }
  return null;
}
