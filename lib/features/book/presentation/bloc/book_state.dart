part of 'book_bloc.dart';

sealed class BookState extends Equatable {
  const BookState();

  @override
  List<Object> get props => [];
}

final class BookInitial extends BookState {}

final class BookLoading extends BookState {}

final class BookLoaded extends BookState {
  final List<Book> books;

  const BookLoaded(this.books);

  @override
  List<Object> get props => [books];
}

final class BookError extends BookState {
  final Failure failure;

  const BookError(this.failure);

  @override
  List<Object> get props => [failure];
}
