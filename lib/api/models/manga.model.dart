import 'package:mangajj/api/models/chapterslist.model.dart';

class Manga {
  Manga({
    required this.id,
    required this.title,
    required this.status,
    required this.volumes,
    required this.chapters,
    required this.popularity,
    required this.genres,
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
  late final int? popularity;
  late final List<String>? genres;
  late final String? synopsis;
  late final String? imageUrl;
  // ignore: non_constant_identifier_names
  late final ChaptersList? chapters_list;

  Manga.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    status = json['status'];
    volumes = json['volumes'];
    chapters = json['chapters'];
    popularity = json['popularity'];
    genres = json['genres'] != null
        ? List.castFrom<dynamic, String>(json['genres'])
        : null;
    synopsis = json['synopsis'];
    imageUrl = json['image_url'];
    if (json.containsKey('chapters_list') && json['chapters_list'] != null) {
      chapters_list = ChaptersList.fromJson(json['chapters_list']);
    } else {
      chapters_list = null;
    }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['status'] = status;
    _data['volumes'] = volumes;
    _data['chapters'] = chapters;
    _data['synopsis'] = synopsis;
    _data['popularity'] = popularity;
    _data['genres'] = genres;
    _data['image_url'] = imageUrl;
    if (chapters_list != null) {
      _data['chapters_list'] = chapters_list!.toJson();
    }

    return _data;
  }
}
