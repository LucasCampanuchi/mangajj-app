class MangaModel {
  MangaModel({
    required this.id,
    required this.title,
    required this.status,
    required this.volumes,
    required this.chapters,
    required this.synopsis,
    required this.imageUrl,
  });
  late final int id;
  late final String? title;
  late final String? status;
  late final int? volumes;
  late final int? chapters;
  late final String? synopsis;
  late final String? imageUrl;

  MangaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    status = json['status'];
    volumes = json['volumes'];
    chapters = json['chapters'];
    synopsis = json['synopsis'];
    imageUrl = json['image_url'];
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
    return _data;
  }
}
