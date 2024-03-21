part of 'package.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    this.onPressed,
    super.key,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      duration: const Duration(milliseconds: 350),
      delay: const Duration(milliseconds: 100),
      child: SizedBox(
        height: UISize.p32,
        child: FloatingActionButton.small(
          heroTag: UniqueKey(),
          tooltip: 'Atrás',
          shape: const CircleBorder(),
          onPressed: onPressed ?? () => context.pop(),
          backgroundColor: Colors.white,
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black87,
            size: UISize.p20,
          ),
        ),
      ),
    );
  }
}
