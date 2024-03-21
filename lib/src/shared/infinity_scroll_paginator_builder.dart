part of 'package.dart';

class InfinityScrollPaginatorBuilder<T> extends StatefulWidget {
  InfinityScrollPaginatorBuilder({
    required this.futurePaginated,
    required this.itemBuilder,
    required this.loadingBuilder,
    this.size = 10,
    this.emptyResultBuilder,
    this.crossAxisCount,
    super.key,
  }) : assert(
          T.runtimeType != List,
          'The future must to return a List type object',
        );

  final Future<T> Function(int page) futurePaginated;
  final Widget Function(BuildContext context, int index) loadingBuilder;
  final Widget Function(BuildContext context, int index, List items)
      itemBuilder;
  final Widget? emptyResultBuilder;
  final int size;
  final int Function(double width)? crossAxisCount;

  @override
  State<InfinityScrollPaginatorBuilder> createState() =>
      _PaginatorBuilderState();
}

class _PaginatorBuilderState<T> extends State<InfinityScrollPaginatorBuilder> {
  int page = 1;
  Timer? _debouncer;
  List<dynamic> items = [];
  bool canFetchData = true;
  bool isLoadingItems = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchFirstPageInfo();
      _scrollControllerListener();
    });
  }

  Future<void> _fetchFirstPageInfo() async {
    _setLoading(true);
    final List<dynamic> firstPageInfo = await widget.futurePaginated(page);
    _addItems(firstPageInfo);
    _setLoading(false);
  }

  void _addItems(List<dynamic> newItems) {
    if (mounted) setState(() => items = [...items, ...newItems]);
  }

  void _setLoading(bool value) {
    if (mounted) setState(() => isLoadingItems = value);
  }

  void _incrementPage() {
    if (mounted) setState(() => page++);
  }

  void _stopFetchingData() {
    if (mounted) setState(() => canFetchData = false);
  }

  Future<void> _fetchNextPageInfo() async {
    _setLoading(true);
    final List<T> nextPageInfo = await widget.futurePaginated(page);
    if (nextPageInfo.length < widget.size) _stopFetchingData();
    _addItems(nextPageInfo);
    _setLoading(false);
  }

  void _scrollControllerListener() {
    _scrollController.addListener(() {
      if (!canFetchData) return;
      if (_scrollController.position.outOfRange) return;

      final double offset = _scrollController.offset;
      final double maxOffset = _scrollController.position.maxScrollExtent;

      if (mounted && offset + 600 >= maxOffset) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_debouncer?.isActive ?? false) _debouncer?.cancel();
          _debouncer = Timer(const Duration(milliseconds: 200), () {
            _incrementPage();
            _fetchNextPageInfo();
          });
        });
      }
    });
  }

  int calculeCrossAxisCount(double width) {
    if (width <= 600) return 2;
    if (width > 600 && width <= 900) return 3;
    if (width > 900 && width <= 1200) return 4;
    return 5;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _debouncer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    if (items.isEmpty && !isLoadingItems && widget.emptyResultBuilder != null) {
      return widget.emptyResultBuilder!;
    }

    return GridViewCustom(
      shrinkWrap: true,
      crossAxisCount: widget.crossAxisCount != null
          ? widget.crossAxisCount!(width)
          : calculeCrossAxisCount(width),
      padding: paddingH24,
      header: gapH8,
      itemCount: items.isEmpty ? 10 : items.length,
      footer: const EndPageDivider(),
      controller: _scrollController,
      crossAxisSpacing: UISize.p20,
      mainAxisSpacing: UISize.p20,
      builder: items.isEmpty
          ? widget.loadingBuilder
          : (context, index) => widget.itemBuilder(context, index, items),
      loadingBuilder: isLoadingItems ? widget.loadingBuilder : null,
    );
  }
}
