import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simple_book_explorer/core/core.dart';

import '../../domain/entities/book.dart';
import '../../domain/repositories/book_repository.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookRepository bookRepository;
  BookBloc(this.bookRepository) : super(BookInitial()) {
    on<FetchBooks>(_onFetchBooks);
  }

  Future<void> _onFetchBooks(FetchBooks event, Emitter<BookState> emit) async {
    emit(BookLoading());
    final eitherBooks = await bookRepository.getBooks();
    eitherBooks.fold(
      (failure) => emit(BookError(failure)),
      (books) => emit(BookLoaded(books)),
    );
  }
}
