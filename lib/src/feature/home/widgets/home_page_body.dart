part of '../package.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final booksProvider = Provider.of<BooksProvider>(context, listen: false);

    return Align(
      child: FutureBuilder<List<Book>>(
        future: booksProvider.getLastestBooks(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Book> firstTenBooks = snapshot.data!.sublist(0, 10);
            return BookCardSwiper(books: firstTenBooks);
          }
          return const Align(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
