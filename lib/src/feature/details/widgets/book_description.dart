part of '../package.dart';

class BookDescription extends StatelessWidget {
  final BookDetailsModel? book;
  const BookDescription({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: paddingH24,
      child: (book != null)
          ? Text(
              book!.desc,
              textAlign: TextAlign.justify,
              style: context.textStyles.bodyText1.regular.black,
            )
          : Column(
              children: [
                ...List.generate(
                  7,
                  (index) => const Padding(
                    padding: paddingV4,
                    child: TextShimmer(height: UISize.p16),
                  ),
                ),
              ],
            ),
    );
  }
}
