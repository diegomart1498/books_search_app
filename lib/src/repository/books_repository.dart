import 'package:books_search_app/src/configs/utilities/package.dart';
import 'package:http/http.dart' as http;
import '../feature/details/models/book_details_model.dart';
import '../feature/home/models/new_books_response_model.dart';

class BooksRepository {
  static const String baseUrl = 'https://api.itbook.store/1.0';

  static Future<List<Book>> getLastestBooks() async {
    final Uri url = Uri.parse('$baseUrl/new');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return NewBooksReponseModel.fromRawJson(response.body).books;
      }
    } catch (error) {
      logge('getLastestBooks error -> $error');
    }
    return [];
  }

  static Future<List<Book>> searchBooks(String query, {int page = 1}) async {
    final Uri url = Uri.parse('$baseUrl/search/$query/$page');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return NewBooksReponseModel.fromRawJson(response.body).books;
      }
    } catch (error) {
      logge('searchBooks error -> $error');
    }
    return [];
  }

  static Future<BookDetailsModel?> getBookById(String isbn13) async {
    final Uri url = Uri.parse('$baseUrl/books/$isbn13');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return BookDetailsModel.fromRawJson(response.body);
      }
    } catch (error) {
      logge('getBookById error -> $error');
    }
    return null;
  }
}
