part of 'package.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    required this.imageUrl,
    this.borderRadius = BorderRadius.zero,
    this.height,
    this.width,
    super.key,
  });

  final String imageUrl;
  final double? height;
  final double? width;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: CachedNetworkImage(
        fadeInDuration: const Duration(milliseconds: 200),
        fadeOutDuration: const Duration(milliseconds: 300),
        key: UniqueKey(),
        imageUrl: imageUrl,
        height: height ?? double.infinity,
        width: width ?? double.infinity,
        fit: BoxFit.cover,
        placeholder: (context, url) => const TextShimmer(
          height: double.infinity,
          width: double.infinity,
        ),
        errorWidget: (context, url, error) {
          logge('cachedNetworkImage -> $error - url -> $url');
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
