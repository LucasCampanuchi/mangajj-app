class Page {
  Page({
    required this.id,
    required this.chapterId,
    required this.imageUrl,
    required this.pageNumber,
  });
  late final String id;
  late final String chapterId;
  late final String imageUrl;
  late final int pageNumber;

  Page.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chapterId = json['chapterId'];
    imageUrl = json['imageUrl'];
    pageNumber = json['page_number'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['chapterId'] = chapterId;
    _data['imageUrl'] = imageUrl;
    _data['page_number'] = pageNumber;
    return _data;
  }
}
