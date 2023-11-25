import 'package:flutter/material.dart';
import 'package:flutter_ebook_app/models/book.dart';
import 'package:flutter_ebook_app/screens/home/pages/book_details.dart';
import 'package:flutter_ebook_app/themes.dart';

class TrendingBook extends StatelessWidget {
  const TrendingBook({
    super.key,
    required this.info,
  });

  final BookList info;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, BookDetail.nameRoute, arguments: {
              'imageUrl': info.imageUrl,
              'writers': info.writers,
              'title': info.title,
            });
          },
          child: Hero(
            tag: info.imageUrl,
            child: Container(
              height: 160,
              width: 110,
              margin: EdgeInsets.only(top: 10, right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(info.imageUrl),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          info.writers,
          style: mediumText12.copyWith(color: greyColor),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          info.title,
          style: semiBoldText14.copyWith(color: blackColor),
        ),
      ],
    );
  }
}
