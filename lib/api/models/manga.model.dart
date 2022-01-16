import 'chapter.model.dart';

class Manga {
  Manga({
    required this.id,
    required this.title,
    required this.status,
    required this.volumes,
    required this.chapters,
    required this.synopsis,
    required this.imageUrl,
    // ignore: non_constant_identifier_names
    required this.chapters_list,
  });
  late final int id;
  late final String? title;
  late final String? status;
  late final int? volumes;
  late final int? chapters;
  late final String? synopsis;
  late final String? imageUrl;
  // ignore: non_constant_identifier_names
  late final List<Chapter>? chapters_list;

  Manga.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    status = json['status'];
    volumes = json['volumes'];
    chapters = json['chapters'];
    synopsis = json['synopsis'];
    imageUrl = json['image_url'];
    chapters_list = json['chapters_list'] != null
        ? List.from(json['chapters_list'])
            .map((e) => Chapter.fromJson(e))
            .toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['status'] = status;
    _data['volumes'] = volumes;
    _data['chapters'] = chapters;
    _data['synopsis'] = synopsis;
    _data['image_url'] = imageUrl;
    _data['chapters_list'] = chapters_list != null
        ? chapters_list!.map((e) => e.toJson()).toList()
        : null;

    return _data;
  }
}
