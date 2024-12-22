import 'package:courses_eshop_app/common/image_widgets.dart';
import 'package:courses_eshop_app/common/widgets/app_bar.dart';
import 'package:courses_eshop_app/common/widgets/popup_messages.dart';
import 'package:courses_eshop_app/features/lesson_detail/controller/lesson_detail_controller.dart';
import 'package:courses_eshop_app/features/lesson_detail/view/widgets/widgets.dart';
import 'package:courses_eshop_app/gen/assets.gen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class LessonDetailScreen extends ConsumerStatefulWidget {
  static const kRoute = '/lesson-detail';

  const LessonDetailScreen({super.key});

  @override
  ConsumerState<LessonDetailScreen> createState() => _LessonDetailScreenState();
}

class _LessonDetailScreenState extends ConsumerState<LessonDetailScreen> {
  // late int id;
  int videoIndex = 0;

  @override
  void didChangeDependencies() {
    // var args = ModalRoute.of(context)!.settings.arguments as Map;
    // id = args['id'];
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var lessonData = ref.watch(lessonDetailControllerProvider(id: id));
    var lessonData = ref.watch(lessonDataControllerProvider);

    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Lesson Detail',
      ),
      body: lessonData.value?.videoItems != null && lessonData.value!.videoItems.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Column(
                children: [
                  lessonData.when(
                    data: (data) {
                      return Column(
                        children: [
                          Container(
                            width: 325.w,
                            height: 200.h,
                            decoration: networkImageDecoration(imagePath: data.videoItems.first.thumbnail!),
                            child: FutureBuilder(
                              future: data.initializeVideoPlayer,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.done) {
                                  return videoPlayerController == null
                                      ? const SizedBox()
                                      : Stack(
                                          children: [
                                            VideoPlayer(videoPlayerController!),
                                          ],
                                        );
                                }
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 25.w,
                              right: 25.w,
                              top: 10.h,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  child: data.isPlay
                                      ? AppImageWidget(
                                          img: Assets.icons.pause.path,
                                          width: 24.w,
                                        )
                                      : SizedBox(
                                          width: 24.w,
                                          child: Center(
                                            child: AppImageWidget(
                                              img: Assets.icons.playCircle.path,
                                              width: 18.w,
                                            ),
                                          ),
                                        ),
                                  onTap: () {
                                    if (data.isPlay) {
                                      videoPlayerController?.pause();
                                      ref.read(lessonDataControllerProvider.notifier).playPause(false);
                                    } else {
                                      videoPlayerController?.play();
                                      ref.read(lessonDataControllerProvider.notifier).playPause(true);
                                    }
                                  },
                                ),
                                const SizedBox(width: 16),
                                GestureDetector(
                                  onTap: () {
                                    if (videoIndex > 0) {
                                      videoIndex--;
                                      var videoItem = data.videoItems[videoIndex].url;
                                      ref.read(lessonDataControllerProvider.notifier).playNextVid(videoItem!);
                                    } else {
                                      toastInfo('No earlier videos');
                                    }
                                  },
                                  child: AppImageWidget(
                                    img: Assets.icons.rewindLeft.path,
                                    width: 24.w,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                GestureDetector(
                                  onTap: () {
                                    if (videoIndex < data.videoItems.length - 1) {
                                      videoIndex++;
                                      var videoItem = data.videoItems[videoIndex].url;
                                      ref.read(lessonDataControllerProvider.notifier).playNextVid(videoItem!);
                                    } else {
                                      toastInfo('No more videos');
                                    }
                                  },
                                  child: AppImageWidget(
                                    img: Assets.icons.rewindRight.path,
                                    width: 24.w,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          LessonVideosWidget(
                            items: data.videoItems,
                            playVideo: (int i) {
                              if (i != videoIndex) {
                                videoIndex = i;
                                ref.watch(lessonDataControllerProvider.notifier).playNextVid(data.videoItems[i].url!);
                              }
                            },
                          ),
                        ],
                      );
                    },
                    error: (Object error, StackTrace stackTrace) {
                      if (kDebugMode) {
                        print(error.toString());
                      }
                      return const SizedBox();
                    },
                    loading: () {
                      return const SizedBox();
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
