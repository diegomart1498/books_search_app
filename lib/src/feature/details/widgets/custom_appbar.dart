part of '../package.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.book,
  });

  final BookDetailsModel? book;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: const Padding(
        padding: padding12,
        child: CustomBackButton(),
      ),
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: padding8,
        title: Padding(
          padding: paddingH32,
          child: (book != null)
              ? Text(
                  book!.title,
                  style: context.textStyles.h6.bold.black,
                  textAlign: TextAlign.center,
                )
              : const SizedBox.shrink(),
        ),
        background: Stack(
          fit: StackFit.expand,
          children: [
            (book != null)
                ? Image.network(
                    book!.image,
                    fit: BoxFit.cover,
                  )
                : const TextShimmer(),
            const ModalBarrier(color: Colors.white70),
          ],
        ),
      ),
    );
  }
}
