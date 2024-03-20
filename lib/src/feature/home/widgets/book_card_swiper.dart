part of '../package.dart';

class BookCardSwiper extends StatelessWidget {
  const BookCardSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.8,
      child: Swiper(
        itemCount: 5,
        itemBuilder: (context, index) => Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(UISize.p16),
          ),
          // margin: paddingH24,
          child: Image.network(
            'https://unblast.com/wp-content/uploads/2018/02/Front-View-Hardcover-Book-Mockup.jpg',
            fit: BoxFit.cover,
          ),
        ),
        autoplayDelay: 8000,
        autoplay: true,
        outer: true,
        pagination: const SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            activeColor: Colors.purple,
            color: Colors.grey,
            activeSize: UISize.p8,
            size: UISize.p8,
          ),
        ),
      ),
    );
  }
}
