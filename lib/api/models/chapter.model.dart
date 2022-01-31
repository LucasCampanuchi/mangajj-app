class Chapter {
  Chapter({
    required this.id,
    required this.title,
    required this.url,
    required this.number,
    required this.releaseDate,
    required this.status,
    required this.idManga,
    required this.createdAt,
  });
  late final String id;
  late final String title;
  late final String url;
  late final String number;
  late final String releaseDate;
  late String status;
  late final int idManga;
  late final dynamic createdAt;

  Chapter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    url = json['url'];
    number = json['number'];
    releaseDate = json['releaseDate'];
    status = json['status'];
    idManga = json['id_manga'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['url'] = url;
    _data['number'] = number;
    _data['releaseDate'] = releaseDate;
    _data['status'] = status;
    _data['id_manga'] = idManga;
    _data['created_at'] = createdAt;
    return _data;
  }
}
