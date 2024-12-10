import 'package:courses_eshop_app/common/services/app_http_client.dart';
import 'package:courses_eshop_app/common/utils/constants.dart';
import 'package:courses_eshop_app/models/course.dart';

class CourseDetailRepo {
  static Future<CourseDetailResponseEntity?> courseDetail({CourseRequestEntity? params}) async {
    var response = await AppHttpClient().get(
      Endpoints.COURSE_DETAIL,
      queryParameters: params?.toJson(),
    );

    return CourseDetailResponseEntity.fromJson(response);
  }
}
