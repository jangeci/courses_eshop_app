import 'package:courses_eshop_app/common/button_widgets.dart';
import 'package:courses_eshop_app/common/widgets/app_bar.dart';
import 'package:courses_eshop_app/features/author_page/controller/author_controller.dart';
import 'package:courses_eshop_app/features/author_page/widgets/author_widgets.dart';
import 'package:courses_eshop_app/models/course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthorScreen extends ConsumerStatefulWidget {
  static const kRoute = '/author-page';

  const AuthorScreen({super.key});

  @override
  ConsumerState<AuthorScreen> createState() => _AuthorScreenState();
}

class _AuthorScreenState extends ConsumerState<AuthorScreen> {
  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    ref.watch(authorCoursesControllerProvider.notifier).init(args['token']);
    ref.watch(authorControllerProvider.notifier).init(args['token']);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var authorInfo = ref.watch(authorControllerProvider);
    var authorCourses = ref.watch(authorCoursesControllerProvider);
    return Scaffold(
        appBar: const AppBarWidget(
          title: 'Author page',
        ),
        body: switch (authorInfo) {
          AsyncData(:final value) => value == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: Column(
                        children: [
                          AuthorTopSection(value),
                          AuthorDescription(value),
                          AppButtonWidget(
                            text: 'Go Chat',
                            onTap: () {
                              //TODO
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: AuthorCoursesWidget(courses: authorCourses.value ?? []),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
          // TODO: Handle this case.
          AsyncError(:final error) => Text('Error $error'),
          _ => Container()
        });
  }
}
