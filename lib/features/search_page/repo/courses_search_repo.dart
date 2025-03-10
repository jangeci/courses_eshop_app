import 'package:courses_eshop_app/common/services/app_http_client.dart';
import 'package:courses_eshop_app/common/utils/constants.dart';
import 'package:courses_eshop_app/models/course.dart';

class CoursesSearchRepo {
  static Future<CourseListResponseEntity?> coursesDefaultSearch() async {
    var response = await AppHttpClient().get(
      Endpoints.RECOMMENDED_COURSES,
    );

    return CourseListResponseEntity.fromJson(response);
  }

  static Future<CourseListResponseEntity?> coursesSearch({SearchRequestEntity? params}) async {
    var response = await AppHttpClient().get(
      Endpoints.COURSES_SEARCH,
      queryParameters: params?.toJson(),
    );

    return CourseListResponseEntity.fromJson(response);
  }
}
