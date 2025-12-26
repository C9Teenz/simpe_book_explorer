// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final String? title;
  final int? coverId;
  final List<Author>? authors;
  const Book({
    this.title,
    this.coverId,
    this.authors,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [title, coverId, authors];
}

class Author extends Equatable {
  final String? key;
  final String? name;
  const Author({
    this.key,
    this.name,
  });

  @override
  List<Object?> get props => [key, name];
}
