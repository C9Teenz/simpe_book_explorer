import 'package:flutter/material.dart';
import 'package:simple_book_explorer/features/book/presentation/ui/widgets/custom_image_network.dart';

import '../../../domain/entities/book.dart';
import '../book_details_page.dart';

class BookItem extends StatelessWidget {
  final Book book;
  const BookItem({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return BookDetailsPage(book: book);
          }));
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: 'book_cover_${book.coverId}',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CustomImageNetwork(
                    coverId: book.coverId,
                    width: 80,
                    height: 120,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      book.title ?? 'No Title',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.person_outline,
                          size: 16,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            _getAuthorsText(book.authors),
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: Colors.grey[400],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getAuthorsText(List<Author>? authors) {
    if (authors == null || authors.isEmpty) {
      return 'Unknown Author';
    }
    List<String?> newAuthors = authors.map((author) => author.name).toList();
    return newAuthors.join(', ');
  }
}
