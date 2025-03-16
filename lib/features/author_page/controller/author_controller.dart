import 'package:courses_eshop_app/features/author_page/repo/course_author_repo.dart';
import 'package:courses_eshop_app/models/course.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'author_controller.g.dart';

@riverpod
class AuthorCoursesController extends _$AuthorCoursesController {

  @override
  FutureOr<List<CourseItem>?> build() async {
    return [];
  }

  void init(String token){
    loadCourseData(token);
  }

  loadCourseData(String token) async {
    AuthorRequestEntity authorRequestEntity = AuthorRequestEntity(token: token);
    var response = await CourseAuthorRepo.authorCourseList(authorRequestEntity);

    if(response.code == 200){
      state = AsyncValue.data(response.data);
    }
  }
}


@riverpod
class AuthorController extends _$AuthorController {

  @override
  FutureOr<AuthorItem?> build() async {
    return null;
  }

  void init(String token){
    loadAuthorData(token);
  }

  loadAuthorData(String token) async {
    AuthorRequestEntity authorRequestEntity = AuthorRequestEntity(token: token);
    var response = await CourseAuthorRepo.authorDetail(authorRequestEntity);

    if(response.code == 200){
      state = AsyncValue.data(response.data);
    }
  }
}