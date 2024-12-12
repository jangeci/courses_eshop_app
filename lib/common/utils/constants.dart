class AppConstants {
  static const String SERVER_API_URL = 'http://localhost/';
  //android
  // static const String SERVER_API_URL = 'http://10.0.2.2:8000/';
  static const String IMAGE_UPLOADS_PATH = '${SERVER_API_URL}uploads/';
  static const String STORAGE_USER_PROFILE_KEY = 'user_profile';
  static const String STORAGE_USER_TOKEN_KEY = 'user_token';
  static const String STORAGE_DEVICE_OPEN_FIRST_KEY = 'first_time';
}

class Endpoints {
  static const String LOGIN = 'api/login';
  static const String COURSES = 'api/courses';
  static const String COURSE_DETAIL = 'api/course-detail';
  static const String LESSONS = 'api/course-lessons';
}

String getImageUrl(String path){
  return '${AppConstants.IMAGE_UPLOADS_PATH}${path}';
}