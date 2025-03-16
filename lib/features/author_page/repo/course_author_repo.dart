import 'package:courses_eshop_app/common/services/app_http_client.dart';
import 'package:courses_eshop_app/common/utils/constants.dart';
import 'package:courses_eshop_app/models/course.dart';

class CourseAuthorRepo {
  static Future<CourseListResponseEntity> authorCourseList(AuthorRequestEntity params) async {
    var response = await AppHttpClient().post(
      Endpoints.AUTHOR_COURSES,
      queryParameters: params.toJson(),
    );

    return CourseListResponseEntity.fromJson(response);
  }

  static Future<AuthorResponseEntity> authorDetail(AuthorRequestEntity params) async {
    var response = await AppHttpClient().get(
      Endpoints.AUTHOR_DETAIL,
      queryParameters: params.toJson(),
    );

    return AuthorResponseEntity.fromJson(response);
  }
}
