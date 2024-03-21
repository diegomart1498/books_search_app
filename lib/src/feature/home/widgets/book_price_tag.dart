part of '../package.dart';

class BookPriceTag extends StatelessWidget {
  const BookPriceTag({
    required this.bookPrice,
    super.key,
  });

  final String bookPrice;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: UISize.p0,
      bottom: UISize.p0,
      child: Container(
        height: UISize.p48,
        width: UISize.p96,
        decoration: BoxDecoration(
          color: Colors.blue[600],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(UISize.p12),
            bottomLeft: Radius.circular(UISize.p12),
            bottomRight: Radius.circular(UISize.p20),
          ),
        ),
        padding: paddingV12,
        child: Align(
          child: Text(
            bookPrice,
            maxLines: 1,
            style: context.textStyles.subtitle1.bold.white,
          ),
        ),
      ),
    );
  }
}
