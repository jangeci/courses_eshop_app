import 'package:courses_eshop_app/common/utils/app_colors.dart';
import 'package:courses_eshop_app/common/widgets/app_bar.dart';
import 'package:courses_eshop_app/common/widgets/text_widgets.dart';
import 'package:courses_eshop_app/features/lesson_detail/controller/lesson_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LessonDetailScreen extends ConsumerStatefulWidget {
  static const kRoute = '/lesson-detail';

  const LessonDetailScreen({super.key});

  @override
  ConsumerState<LessonDetailScreen> createState() => _LessonDetailScreenState();
}

class _LessonDetailScreenState extends ConsumerState<LessonDetailScreen> {
  late int id;

  @override
  void didChangeDependencies() {
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    id = args['id'];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var lessonData = ref.watch(lessonDetailControllerProvider(id: id));

    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Lesson Detail',
      ),
      body: SingleChildScrollView(
          child: lessonData.when(
        data: (data) {
          if (data == null) {
            return const SizedBox();
          } else {
            print(data.name);
            return Column(
              children: [
                Text14Normal(
                  data.name!,
                  color: AppColors.primaryText,
                ),
              ],
            );
          }
        },
        error: (Object error, StackTrace stackTrace) {
          print(error.toString());

          return const SizedBox();
        },
        loading: () {
          return const SizedBox();
        },
      )),
    );
  }
}
