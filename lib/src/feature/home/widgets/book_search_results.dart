part of '../package.dart';

class BookSearchResults extends StatefulWidget {
  const BookSearchResults({
    required this.searchQuery,
    this.hasDebouncer = false,
    super.key,
  });

  final String searchQuery;
  final bool hasDebouncer;

  @override
  State<BookSearchResults> createState() => _BookSearchResultsState();
}

class _BookSearchResultsState extends State<BookSearchResults> {
  Timer? _debouncer;
  bool _isWaiting = false;

  Future<List<Book>> futurePaginated(String search, int page) async {
    final booksProvider = Provider.of<BooksProvider>(context, listen: false);
    final List<Book> books = await booksProvider.searchBooks(
      widget.searchQuery,
      page: page,
    );
    return books;
  }

  void _setIsWaiting(bool value) {
    if (mounted) setState(() => _isWaiting = value);
  }

  @override
  void didUpdateWidget(covariant BookSearchResults oldWidget) {
    if (!widget.hasDebouncer) return;
    if (oldWidget.searchQuery != widget.searchQuery) {
      _setIsWaiting(true);
      if (_debouncer?.isActive ?? false) _debouncer?.cancel();
      _debouncer = Timer(
          const Duration(milliseconds: DurationConstants.debouncerMillisec),
          () {
        _setIsWaiting(false);
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _debouncer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.searchQuery.isEmpty) {
      return const CustomEmptySpace(
        icon: Icons.manage_search_rounded,
        message: 'Busca los libros\nde tu interés.',
      );
    }

    if (_isWaiting) return const LinearProgressIndicator();

    return InfinityScrollPaginatorBuilder<List<Book>>(
      futurePaginated: (page) => futurePaginated(widget.searchQuery, page),
      itemBuilder: (context, index, items) => BookCard(book: items[index]),
      loadingBuilder: (context, index) => const BookCardShimmer(),
      emptyResultBuilder: const CustomEmptySpace(
        message: 'No hay libros que coincidan\ncon tu búsqueda.',
      ),
    );
  }
}
