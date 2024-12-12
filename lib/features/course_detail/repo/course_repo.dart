import 'package:courses_eshop_app/common/services/app_http_client.dart';
import 'package:courses_eshop_app/common/utils/constants.dart';
import 'package:courses_eshop_app/models/course.dart';
import 'package:courses_eshop_app/models/lesson_model.dart';

class CourseRepo {
  static Future<CourseDetailResponseEntity?> courseDetail({CourseRequestEntity? params}) async {
    var response = await AppHttpClient().get(
      Endpoints.COURSE_DETAIL,
      queryParameters: params?.toJson(),
    );

    return CourseDetailResponseEntity.fromJson(response);
  }

  static Future<LessonListResponseEntity?> lessons({LessonRequestEntity? params}) async {
    var response = await AppHttpClient().get(
      Endpoints.LESSONS,
      queryParameters: params?.toJson(),
    );

    return LessonListResponseEntity.fromJson(response);
  }
}
