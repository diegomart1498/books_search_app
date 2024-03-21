part of '../package.dart';

class BookImageAndTitle extends StatelessWidget {
  const BookImageAndTitle({
    required this.book,
    super.key,
  });
  final BookDetailsModel? book;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: UISize.p20),
      padding: paddingH20,
      child: Row(
        children: [
          Hero(
            tag: book?.isbn13 ?? '',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(UISize.p20),
              child: (book != null)
                  ? Image.network(
                      book!.image,
                      width: size.width * 0.35,
                    )
                  : TextShimmer(
                      height: 200,
                      width: size.width * 0.35,
                    ),
            ),
          ),
          gapW8,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (book != null)
                    ? Text(
                        book!.title,
                        style: context.textStyles.subtitle1.medium.black,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      )
                    : const TextShimmer(height: UISize.p24),
                if (book?.subtitle.isNotEmpty ?? false) ...[
                  gapH12,
                  (book != null)
                      ? Text(
                          book?.subtitle ?? '',
                          style: context.textStyles.subtitle2.medium.black,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        )
                      : const TextShimmer(height: UISize.p20),
                ],
                gapH12,
                _LabelText(
                  'Autor: ${book?.authors ?? ''}',
                  style: context.textStyles.subtitle2.regular.black,
                ),
                _LabelText(
                  'Lenguaje: ${book?.language ?? ''}',
                  style: context.textStyles.subtitle2.regular.black,
                ),
                _LabelText(
                  'Año: ${book?.year ?? ''}',
                  style: context.textStyles.subtitle2.regular.black,
                ),
                gapH12,
                Row(
                  children: [
                    const Icon(
                      Icons.star_outline,
                      color: Color.fromARGB(255, 255, 179, 0),
                    ),
                    gapW4,
                    _LabelText(
                      book?.rating ?? '',
                      style: context.textStyles.subtitle2.regular.black,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LabelText extends StatelessWidget {
  const _LabelText(
    this.text, {
    required this.style,
  });

  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }
}
