import 'package:dartz/dartz.dart';
import 'package:simple_book_explorer/core/core.dart';

import '../entities/book.dart';

abstract class BookRepository {
  Future<Either<Failure, List<Book>>> getBooks();
}
