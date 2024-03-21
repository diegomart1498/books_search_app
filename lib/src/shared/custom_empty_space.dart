part of 'package.dart';

class CustomEmptySpace extends StatelessWidget {
  const CustomEmptySpace({
    required this.message,
    this.icon,
    super.key,
  });

  final String message;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      delay: const Duration(milliseconds: 250),
      child: Align(
        child: ListView(
          shrinkWrap: true,
          children: [
            Align(
              child: Icon(
                icon ?? Icons.filter_alt_off_rounded,
                size: UISize.p144,
              ),
            ),
            gapH48,
            Padding(
              padding: paddingH24,
              child: Text(
                message,
                style: context.textStyles.h6.semiBold.black,
                textAlign: TextAlign.center,
              ),
            ),
            gapH104,
          ],
        ),
      ),
    );
  }
}
