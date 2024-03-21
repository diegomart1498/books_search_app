part of 'package.dart';

class TextShimmer extends StatelessWidget {
  const TextShimmer({
    this.height,
    this.width,
    this.borderRadius,
    super.key,
  });

  final double? height;
  final double? width;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFEEEEEE),
      highlightColor: const Color(0xFFA8A8A8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(borderRadius ?? UISize.p4)),
          color: Colors.amber,
        ),
        height: height ?? 20,
        width: width ?? 200,
      ),
    );
  }
}
