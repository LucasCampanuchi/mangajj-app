import 'package:mangajj/api/models/chapter.model.dart';

class ChaptersList {
  List<Chapter>? data;
  int? lastPage;

  ChaptersList({this.data, this.lastPage});

  ChaptersList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Chapter>[];
      json['data'].forEach((v) {
        data!.add(Chapter.fromJson(v));
      });
    }
    lastPage = json['last_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['last_page'] = lastPage;
    return data;
  }
}
