class LessonRequestEntity {
  int? id;

  LessonRequestEntity({this.id});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}

class LessonListResponseEntity {
  int? code;
  String? msg;
  List<LessonModel>? data;

  LessonListResponseEntity({
    this.code,
    this.data,
    this.msg,
  });

  factory LessonListResponseEntity.fromJson(Map<String, dynamic> json) {
    return LessonListResponseEntity(
      code: json['code'],
      msg: json['msg'],
      data: json['data'] == null
          ? []
          : List<LessonModel>.from(
              json['data'].map((item) {
                return LessonModel.fromJson(item);
              }),
            ),
    );
  }
}

class LessonDetailResponseEntity {
  int? code;
  String? msg;
  LessonModel? data;

  LessonDetailResponseEntity({
    this.code,
    this.data,
    this.msg,
  });

  factory LessonDetailResponseEntity.fromJson(Map<String, dynamic> json) {
    return LessonDetailResponseEntity(
      code: json['code'],
      msg: json['msg'],
      data: json['data'] == null
          ? null
          : LessonModel.fromJson(
              json['data'],
            ),
    );
  }
}

class LessonModel {
  int id;
  String name;
  String? description;
  String? thumbnail;
  List<VideoItem> videoItems;

  LessonModel({required this.id, required this.name, this.description, this.thumbnail, this.videoItems = const []});

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return LessonModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        thumbnail: json['thumbnail'],
        videoItems: json['video'] != null
            ? (json['video'] as List<dynamic>).map((v) {
                return new VideoItem.fromJson(v);
              }).toList()
            : []);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['thumbnail'] = thumbnail;
    data['video'] = videoItems!.map((v) => v.toJson()).toList();
    return data;
  }
}

class VideoItem {
  String? url;
  String? name;
  String? thumbnail;

  VideoItem({this.url, this.name, this.thumbnail});

  VideoItem.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    name = json['name'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['name'] = name;
    data['thumbnail'] = thumbnail;
    return data;
  }
}

class LessonVideo {
  final List<VideoItem> videoItems;
  final Future<void>? initializeVideoPlayer;
  final bool isPlay;
  final String? url;

  LessonVideo({
    this.initializeVideoPlayer,
    this.isPlay = false,
    this.videoItems = const [],
    this.url,
  });

  LessonVideo copyWith({
    List<VideoItem>? videoItems,
    Future<void>? initializeVideoPlayer,
    bool? isPlay,
    String? url,
  }) {
    return LessonVideo(
      initializeVideoPlayer: initializeVideoPlayer ?? this.initializeVideoPlayer,
      isPlay: isPlay ?? this.isPlay,
      videoItems: videoItems ?? this.videoItems,
      url: url ?? this.url,
    );
  }
}
