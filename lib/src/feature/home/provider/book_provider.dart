part of '../package.dart';

class BooksProvider extends ChangeNotifier {
  static String noInternetMessage = 'No hay conexión a internet';

  Future<List<Book>> getLastestBooks() async {
    if (!await InternetConnectionChecker.hasConnection()) {
      toast(noInternetMessage);
    }

    final List<Book> lastetsBooks = await BooksRepository.getLastestBooks();
    return lastetsBooks;
  }

  Future<List<Book>> searchBooks(String query, {int page = 1}) async {
    if (!await InternetConnectionChecker.hasConnection()) {
      toast(noInternetMessage);
    }
    final List<Book> lastetsBooks = await BooksRepository.searchBooks(query);
    return lastetsBooks;
  }

  Future<BookDetailsModel?> getBookById(String isbn13) async {
    if (!await InternetConnectionChecker.hasConnection()) {
      toast(noInternetMessage);
    }
    final BookDetailsModel? lastetsBooks =
        await BooksRepository.getBookById(isbn13);
    return lastetsBooks;
  }
}
