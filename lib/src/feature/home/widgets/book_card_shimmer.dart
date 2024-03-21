part of '../package.dart';

class BookCardShimmer extends StatelessWidget {
  const BookCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Card(
        elevation: 1,
        margin: padding0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UISize.p20),
        ),
        child: const TextShimmer(borderRadius: UISize.p20),
      ),
    );
  }
}
