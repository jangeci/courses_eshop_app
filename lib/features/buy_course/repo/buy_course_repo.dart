import 'package:courses_eshop_app/common/services/app_http_client.dart';
import 'package:courses_eshop_app/common/utils/constants.dart';
import 'package:courses_eshop_app/models/base_entities.dart';
import 'package:courses_eshop_app/models/course.dart';

class BuyCourseRepo {
  static Future<BaseResponseEntity?> buyCourse({CourseRequestEntity? params}) async {
    var response = await AppHttpClient().post(
      Endpoints.CHECKOUT,
      queryParameters: params?.toJson(),
    );

    return BaseResponseEntity.fromJson(response);
  }
}
