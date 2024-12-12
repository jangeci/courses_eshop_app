import 'package:courses_eshop_app/common/services/app_http_client.dart';
import 'package:courses_eshop_app/common/utils/constants.dart';
import 'package:courses_eshop_app/models/lesson_model.dart';

class LessonRepo {
  static Future<LessonDetailResponseEntity?> lessonDetail({LessonRequestEntity? params}) async {
    var response = await AppHttpClient().get(
      Endpoints.LESSON_DETAIL,
      queryParameters: params?.toJson(),
    );

    return LessonDetailResponseEntity.fromJson(response);
  }
}
