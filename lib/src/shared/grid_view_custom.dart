part of 'package.dart';

class GridViewCustom extends StatelessWidget {
  const GridViewCustom({
    required this.builder,
    required this.itemCount,
    required this.crossAxisCount,
    required this.padding,
    this.crossAxisSpacing = 8,
    this.mainAxisSpacing = 8,
    this.rowCrossAxisAlignment = CrossAxisAlignment.start,
    this.controller,
    this.shrinkWrap = false,
    this.physics,
    this.header,
    this.footer,
    this.loadingBuilder,
    super.key,
  });

  final IndexedWidgetBuilder builder;
  final int itemCount;
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final CrossAxisAlignment rowCrossAxisAlignment;
  final EdgeInsets padding;
  final Widget? header;
  final Widget? footer;
  final Widget Function(BuildContext context, int index)? loadingBuilder;
  final ScrollPhysics? physics;
  final ScrollController? controller;
  final bool shrinkWrap;

  int columnLength() {
    if (itemCount % crossAxisCount == 0) {
      return itemCount ~/ crossAxisCount;
    } else {
      return (itemCount ~/ crossAxisCount) + 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: padding,
      controller: controller,
      shrinkWrap: shrinkWrap,
      physics: physics,
      itemBuilder: (context, columnIndex) {
        if (columnIndex == 0) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (header != null) header!,
              _gridRow(columnIndex),
              if (footer != null && columnIndex == itemCount - 1) footer!,
            ],
          );
        }
        if (columnIndex == columnLength() - 1) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _gridRow(columnIndex),
              if (loadingBuilder != null) _gridViewLoadingContent(columnIndex),
              if (footer != null) footer!,
            ],
          );
        }
        return _gridRow(columnIndex);
      },
      itemCount: columnLength(),
    );
  }

  Widget _gridRow(int columnIndex) {
    return _GridRow(
      columnIndex: columnIndex,
      builder: builder,
      itemCount: itemCount,
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: crossAxisSpacing,
      mainAxisSpacing: mainAxisSpacing,
      crossAxisAlignment: rowCrossAxisAlignment,
    );
  }

  Widget _gridViewLoadingContent(int columnIndex) {
    return _GridRow(
      columnIndex: columnIndex - itemCount,
      builder: loadingBuilder!,
      itemCount: itemCount,
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: crossAxisSpacing,
      mainAxisSpacing: mainAxisSpacing,
      crossAxisAlignment: rowCrossAxisAlignment,
    );
  }
}

class _GridRow extends StatelessWidget {
  const _GridRow({
    required this.columnIndex,
    required this.builder,
    required this.itemCount,
    required this.crossAxisCount,
    required this.crossAxisSpacing,
    required this.mainAxisSpacing,
    required this.crossAxisAlignment,
  });
  final IndexedWidgetBuilder builder;
  final int itemCount;
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final CrossAxisAlignment crossAxisAlignment;
  final int columnIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: (columnIndex == 0) ? 0 : mainAxisSpacing,
      ),
      child: Row(
        crossAxisAlignment: crossAxisAlignment,
        children: List.generate(
          (crossAxisCount * 2) - 1,
          (rowIndex) {
            final rowNum = rowIndex + 1;
            if (rowNum % 2 == 0) {
              return SizedBox(width: crossAxisSpacing);
            }
            final rowItemIndex = ((rowNum + 1) ~/ 2) - 1;
            final itemIndex = (columnIndex * crossAxisCount) + rowItemIndex;
            if (itemIndex > itemCount - 1) {
              return const Expanded(child: SizedBox());
            }
            return Expanded(
              child: builder(context, itemIndex),
            );
          },
        ),
      ),
    );
  }
}
