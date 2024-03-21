part of '../package.dart';

class BookSearchDelegate extends CustomSearchDelegate<String?> {
  @override
  String? hintText() => 'Buscar libros';

  @override
  String? appbarTitle() => 'Búsqueda de libros';

  @override
  Widget buildResults(BuildContext context) {
    return BookSearchResults(searchQuery: query.trim());
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return BookSearchResults(searchQuery: query.trim(), hasDebouncer: true);
  }
}
