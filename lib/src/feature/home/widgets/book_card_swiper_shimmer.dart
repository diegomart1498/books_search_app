part of '../package.dart';

class BookCardSwiperShimmer extends StatelessWidget {
  const BookCardSwiperShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.8,
      child: Swiper(
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.8,
        itemHeight: size.height * 0.55,
        itemBuilder: (context, index) => const BookCardShimmer(),
        autoplayDelay: 8000,
        autoplay: true,
        outer: true,
        pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            activeColor: Colors.blue[600],
            color: Colors.grey,
            activeSize: UISize.p8,
            size: UISize.p8,
          ),
        ),
      ),
    );
  }
}
