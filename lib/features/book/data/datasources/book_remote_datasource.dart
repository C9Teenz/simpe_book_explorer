// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:simple_book_explorer/features/book/data/models/book_model.dart';

import '../../../../core/core.dart';

abstract class BookRemoteDataSource {
  Future<List<BookModel>> fetchBooks();
}

class BookRemoteDataSourceImpl implements BookRemoteDataSource {
  final DioClient dioClient;
  BookRemoteDataSourceImpl({
    required this.dioClient,
  });

  @override
  Future<List<BookModel>> fetchBooks() async {
    final response = await dioClient.dio.get(
      '/subjects/love.json',
      queryParameters: {'limit': 10},
    );
    if (response.statusCode == 200) {
      final works = response.data['works'] as List;
      return works
          .map((work) => BookModel.fromMap(work as Map<String, dynamic>))
          .toList();
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
      );
    }
  }
}
