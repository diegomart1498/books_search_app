part of '../package.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    required this.book,
    super.key,
  });

  final Book book;

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
        child: InkWell(
          onTap: () => context.goNamed(
            BookDetailsPage.routeName,
            queryParameters: {'isbn13': book.isbn13},
          ),
          borderRadius: BorderRadius.circular(UISize.p20),
          child: Stack(
            children: [
              Hero(
                tag: book.isbn13,
                child: CustomCachedNetworkImage(
                  imageUrl: book.image,
                  borderRadius: BorderRadius.circular(UISize.p20),
                ),
              ),
              BookPriceTag(bookPrice: book.price),
            ],
          ),
        ),
      ),
    );
  }
}
