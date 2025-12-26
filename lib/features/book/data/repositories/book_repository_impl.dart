// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:simple_book_explorer/core/error/failure.dart';
import 'package:simple_book_explorer/features/book/data/models/book_mapper.dart';
import 'package:simple_book_explorer/features/book/domain/entities/book.dart';

import '../../domain/repositories/book_repository.dart';
import '../datasources/book_remote_datasource.dart';

class BookRepositoryImpl implements BookRepository {
  final BookRemoteDataSource remoteDataSource;
  BookRepositoryImpl({
    required this.remoteDataSource,
  });
  @override
  Future<Either<Failure, List<Book>>> getBooks() async {
    try {
      final bookModels = await remoteDataSource.fetchBooks();
      final books = bookModels.map((book) => book.toEntity()).toList();
      return Right(books);
    } on DioException catch (e) {
      return Left(NetworkFailure(e.error?.toString() ?? "Koneksi terputus"));
    } catch (e) {
      return Left(ServerFailure("Gagal memproses data $e"));
    }
  }
}
