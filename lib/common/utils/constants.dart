class AppConstants {
  //static const String SERVER_API_URL = 'https://ce7f-78-98-70-118.ngrok-free.app/';

  static const String SERVER_API_URL = 'http://localhost/';

  //android
  // static const String SERVER_API_URL = 'http://10.0.2.2:8000/';
  static const String UPLOADS_PATH = '${SERVER_API_URL}uploads/';
  static const String STORAGE_USER_PROFILE_KEY = 'user_profile';
  static const String STORAGE_USER_TOKEN_KEY = 'user_token';
  static const String STORAGE_DEVICE_OPEN_FIRST_KEY = 'first_time';
}

class Endpoints {
  static const String LOGIN = 'api/login';
  static const String COURSES = 'api/courses';
  static const String COURSE_DETAIL = 'api/course-detail';
  static const String LESSONS = 'api/course-lessons';
  static const String LESSON_DETAIL = 'api/lesson-detail';
  static const String VIDEO_STREAM = 'api/video-stream';
  static const String CHECKOUT = 'api/checkout';
  static const String COURSES_BOUGHT = 'api/courses-bought';
  static const String COURSES_SEARCH = 'api/search-courses';
  static const String RECOMMENDED_COURSES = 'api/courses-recommended';
  static const String AUTHOR_COURSES = 'api/author/courses';
  static const String AUTHOR_DETAIL = 'api/author';
}

String getUploadedFileUrl(String path) {
  return '${AppConstants.UPLOADS_PATH}${path}';
}

String getUploadedVideoUrl(String path) {
  final String fileName = path.split('/').last;
  return '${AppConstants.SERVER_API_URL}${Endpoints.VIDEO_STREAM}/$fileName';
}
