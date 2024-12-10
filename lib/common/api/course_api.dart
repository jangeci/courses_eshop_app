import 'package:courses_eshop_app/common/services/app_http_client.dart';
import 'package:courses_eshop_app/common/utils/constants.dart';
import 'package:courses_eshop_app/models/course.dart';

class CourseAPI{
  static Future<CourseListResponseEntity> courseList() async {
    var response = await AppHttpClient().get(Endpoints.COURSES);
    return CourseListResponseEntity.fromJson(response);
  }
}