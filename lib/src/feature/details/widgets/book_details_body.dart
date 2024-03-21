part of '../package.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({
    required this.isbn13,
    super.key,
  });

  final String isbn13;

  @override
  Widget build(BuildContext context) {
    final booksProvider = Provider.of<BooksProvider>(context, listen: false);

    return FutureBuilder<BookDetailsModel?>(
      future: booksProvider.getBookById(isbn13),
      builder: (context, snapshot) {
        final BookDetailsModel? book = snapshot.data;
        return CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            CustomAppBar(book: book),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  BookImageAndTitle(book: book),
                  BookPriceInfo(bookPrice: book?.price),
                  BookDescription(book: book),
                  const Padding(
                    padding: paddingH32,
                    child: EndPageDivider(),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
