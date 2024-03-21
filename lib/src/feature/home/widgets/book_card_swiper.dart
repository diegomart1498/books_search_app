part of '../package.dart';

class BookCardSwiper extends StatelessWidget {
  const BookCardSwiper({
    required this.books,
    super.key,
  });

  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.8,
      child: Swiper(
        itemCount: books.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.8,
        itemHeight: size.height * 0.55,
        itemBuilder: (context, index) => BookCard(book: books[index]),
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
