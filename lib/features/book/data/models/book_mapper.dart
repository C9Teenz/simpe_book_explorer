import 'package:simple_book_explorer/features/book/data/models/book_model.dart';
import 'package:simple_book_explorer/features/book/domain/entities/book.dart';

extension BookMapper on BookModel {
  Book toEntity() {
    return Book(
      title: title,
      coverId: coverId,
      authors: authors == null
          ? []
          : authors!
              .map(
                (authorModel) => Author(
                  key: authorModel.key,
                  name: authorModel.name,
                ),
              )
              .toList(),
    );
  }
}
