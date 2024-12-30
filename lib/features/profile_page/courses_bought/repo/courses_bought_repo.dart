import 'package:courses_eshop_app/common/services/app_http_client.dart';
import 'package:courses_eshop_app/common/utils/constants.dart';
import 'package:courses_eshop_app/models/course.dart';

class CoursesBoughtRepo {
  static Future<CourseListResponseEntity?> coursesBought({CourseRequestEntity? params}) async {
    var response = await AppHttpClient().get(
      Endpoints.COURSES_BOUGHT,
      queryParameters: params?.toJson(),
    );

    return CourseListResponseEntity.fromJson(response);
  }
}
