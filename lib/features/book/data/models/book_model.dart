// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BookModel {
  final String? title;
  final int? coverId;
  final List<AuthorModel>? authors;
  BookModel({
    this.title,
    this.coverId,
    this.authors,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'cover_id': coverId,
      'authors': authors?.map((x) => x.toMap()).toList(),
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      title: map['title'] != null ? map['title'] as String : null,
      coverId: map['cover_id'] != null ? map['cover_id'] as int : null,
      authors: map['authors'] != null
          ? List<AuthorModel>.from(
              (map['authors'] as List<dynamic>).map<AuthorModel?>(
                (x) => AuthorModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookModel.fromJson(String source) =>
      BookModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class AuthorModel {
  final String? key;
  final String? name;
  AuthorModel({
    this.key,
    this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'key': key,
      'name': name,
    };
  }

  factory AuthorModel.fromMap(Map<String, dynamic> map) {
    return AuthorModel(
      key: map['key'] != null ? map['key'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthorModel.fromJson(String source) =>
      AuthorModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
