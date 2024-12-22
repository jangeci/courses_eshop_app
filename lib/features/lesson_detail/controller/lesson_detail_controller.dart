import 'package:courses_eshop_app/common/utils/constants.dart';
import 'package:courses_eshop_app/features/lesson_detail/repo/lesson_repo.dart';
import 'package:courses_eshop_app/models/lesson_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_player/video_player.dart';

part 'lesson_detail_controller.g.dart';

VideoPlayerController? videoPlayerController;

@riverpod
Future<void> lessonDetailController(Ref ref, {required int id}) async {
  LessonRequestEntity lessonRequestEntity = LessonRequestEntity(id: id);
  final response = await LessonRepo.lessonDetail(params: lessonRequestEntity);

  if (response?.code == 200) {
    var url = getUploadedVideoUrl(response!.data!.videoItems[0].url!);

    videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(url),
    );
    var initializeVideoPlayerFuture = videoPlayerController?.initialize();
    LessonVideo vidInstance = LessonVideo(
      videoItems: response.data!.videoItems,
      isPlay: false,
      initializeVideoPlayer: initializeVideoPlayerFuture,
      url: url,
    );
    ref.read(lessonDataControllerProvider.notifier).updateLessonData(vidInstance);
  } else {
    print('Lesson detail request failed ${response?.code}');
  }
}

@riverpod
class LessonDataController extends _$LessonDataController {
  @override
  FutureOr<LessonVideo> build() async {
    return LessonVideo();
  }

  // @override
  // set state(AsyncValue<LessonVideo> newState) {
  // can observe changes here
  //   super.state = newState;
  // }

  void updateLessonData(LessonVideo lesson) {
    update((data) => lesson);
  }

  void playPause(bool play) {
    update((data) => data.copyWith(
          isPlay: play,
        ));
  }

  void playNextVid(String url) {
    if (videoPlayerController != null) {
      videoPlayerController?.pause();
      videoPlayerController?.dispose();
    }

    update(
      (data) => data.copyWith(
        isPlay: false,
        initializeVideoPlayer: null,
      ),
    );

    final String vidUrl = getUploadedVideoUrl(url);
    videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(vidUrl),
    );

    var initializeVideoPlayerFuture = videoPlayerController?.initialize().then((_) {
      videoPlayerController?.seekTo(
        const Duration(seconds: 0),
      );
    });

    update(
      (data) => data.copyWith(
        initializeVideoPlayer: initializeVideoPlayerFuture,
        isPlay: true,
        url: url,
      ),
    );

    videoPlayerController?.play();
  }
}
