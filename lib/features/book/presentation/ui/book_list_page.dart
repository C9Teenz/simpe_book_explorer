import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_book_explorer/core/di/injection_container.dart';
import 'package:simple_book_explorer/features/book/presentation/bloc/book_bloc.dart';

import 'widgets/book_item.dart';

class BookListPage extends StatelessWidget {
  const BookListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<BookBloc>(),
      child: const BookListContent(),
    );
  }
}

class BookListContent extends StatefulWidget {
  const BookListContent({super.key});

  @override
  State<BookListContent> createState() => _BookListContentState();
}

class _BookListContentState extends State<BookListContent> {
  @override
  void initState() {
    context.read<BookBloc>().add(const FetchBooks());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Simple Book Explorer',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<BookBloc, BookState>(
                builder: (context, state) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      context.read<BookBloc>().add(const FetchBooks());
                      await Future.delayed(const Duration(milliseconds: 500));
                    },
                    child: _buildContent(state),
                  );
                },
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget _buildContent(BookState state) {
    final screenHeight = MediaQuery.of(context).size.height;
    final availableHeight = screenHeight -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom -
        100;

    if (state is BookLoading) {
      return ListView(
        children: [
          SizedBox(height: availableHeight * 0.45),
          const Center(child: CircularProgressIndicator()),
        ],
      );
    } else if (state is BookLoaded) {
      return ListView.builder(
        itemCount: state.books.length,
        itemBuilder: (context, index) {
          final book = state.books[index];
          return BookItem(book: book);
        },
      );
    } else if (state is BookError) {
      return ListView(
        children: [
          SizedBox(height: availableHeight * 0.45),
          Center(
            child: Text(
              'Error: ${state.failure.message}',
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: () {
                context.read<BookBloc>().add(const FetchBooks());
              },
              child: const Text('Retry'),
            ),
          ),
        ],
      );
    } else {
      return ListView(
        children: [
          SizedBox(height: availableHeight * 0.45),
          const Center(child: Text('Please wait...')),
        ],
      );
    }
  }
}
