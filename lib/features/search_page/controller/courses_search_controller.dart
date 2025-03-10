import 'package:courses_eshop_app/features/search_page/repo/courses_search_repo.dart';
import 'package:courses_eshop_app/models/course.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

//AutoDisposeAsyncNotifier
//AsyncNotifier same as @Riverpod(keepAlive: true)
class CoursesSearchController extends AsyncNotifier<List<CourseItem>> {
  @override
  FutureOr<List<CourseItem>> build() async {
    state = const AsyncValue.loading();
    final response = await CoursesSearchRepo.coursesDefaultSearch();
    if (response?.code == 200) {
      return response!.data ?? [];
    }
    return [];
  }

  reloadSearchData() async {
    state = const AsyncValue.loading();
    final response = await CoursesSearchRepo.coursesDefaultSearch();
    if (response?.code == 200) {
      state = AsyncValue.data(response!.data ?? []);
    }
  }

  searchData(String search) async {
    state = const AsyncValue.loading();
    SearchRequestEntity searchRequestEntity = SearchRequestEntity(search: search);
    var response = await CoursesSearchRepo.coursesSearch(params: searchRequestEntity);

    if (response?.code == 200) {
      state = AsyncValue.data(response!.data ?? []);
    } else {
      state = AsyncValue.data([]);
    }
  }
}

final coursesSearchControllerProvider = AsyncNotifierProvider<CoursesSearchController, List<CourseItem>>(CoursesSearchController.new);
