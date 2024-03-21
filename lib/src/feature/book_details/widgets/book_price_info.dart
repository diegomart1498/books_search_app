part of '../package.dart';

class BookPriceInfo extends StatelessWidget {
  const BookPriceInfo({
    required this.bookPrice,
    super.key,
  });

  final String? bookPrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding24,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[600],
          borderRadius: const BorderRadius.all(Radius.circular(UISize.p12)),
        ),
        padding: paddingV12,
        child: Align(
          child: (bookPrice != null)
              ? Text(
                  bookPrice!,
                  maxLines: 1,
                  style: context.textStyles.subtitle1.bold.white,
                )
              : const TextShimmer(
                  height: UISize.p24,
                  width: UISize.p80,
                ),
        ),
      ),
    );
  }
}
