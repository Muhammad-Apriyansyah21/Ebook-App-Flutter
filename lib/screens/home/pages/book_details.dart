import 'package:flutter/material.dart';
import 'package:flutter_ebook_app/themes.dart';

class BookDetail extends StatelessWidget {
  static const String nameRoute = '/bookDetails';
  const BookDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final Map data = ModalRoute.of(context)?.settings.arguments as Map;
    // Widget Header Details
    Widget header() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.chevron_left_rounded,
                size: 30,
              ),
            ),
            Text(
              'Book Details',
              style: semiBoldText14.copyWith(
                color: blackColor,
              ),
            ),
            Icon(Icons.share_outlined),
          ],
        ),
      );
    }

    // Widget Gambar Details Book
    Widget bookImage() {
      return Hero(
        tag: data['imageUrl'],
        child: Container(
          height: 267,
          width: 175,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(data['imageUrl']),
            ),
          ),
        ),
      );
    }

    // Widget Info Description
    Widget infoDescription() {
      return Container(
        height: 60,
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        decoration: BoxDecoration(
          color: greyColorInfo,
          borderRadius: BorderRadius.circular(9),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'Rating',
                  style: mediumText10.copyWith(color: deviderColor),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  '4.8',
                  style: semiBoldText12.copyWith(color: blackColor2),
                ),
              ],
            ),
            VerticalDivider(
              color: deviderColor,
              thickness: 1,
            ),
            Column(
              children: [
                Text(
                  'Number Of Pages',
                  style: mediumText10.copyWith(color: deviderColor),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  '180 Pages',
                  style: semiBoldText12.copyWith(color: blackColor2),
                ),
              ],
            ),
            VerticalDivider(
              color: deviderColor,
              thickness: 1,
            ),
            Column(
              children: [
                Text(
                  'Language',
                  style: mediumText10.copyWith(color: deviderColor),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'ENG',
                  style: semiBoldText12.copyWith(color: blackColor2),
                ),
              ],
            ),
          ],
        ),
      );
    }

    // Widget Save Button Logo
    Widget saveButton() {
      return Positioned(
        top: 350,
        right: 20,
        child: Container(
          height: 50,
          width: 50,
          padding: EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(color: greenColor, shape: BoxShape.circle),
          child: Image.asset('assets/icons/icon-save.png'),
        ),
      );
    }

    // Widget Button Read Now
    Widget buttonReadNow() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 15),
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: greenColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Text(
            'Read Now',
            style: semiBoldText20.copyWith(color: whiteColor),
          ),
        ),
      );
    }

    // Widget Description
    Widget description() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['title'],
                        style: semiBoldText20.copyWith(color: blackColor2),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        data['writers'],
                        style: mediumText14.copyWith(color: greyColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Bebas Akses',
                  style: mediumText14.copyWith(color: greenColor),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Decription",
              style: semiBoldText14.copyWith(color: blackColor2),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Enchantment, as defined by bestselling business guru Guy Kawasaki, is not about manipulating people. It transforms situations and relationships.',
              style: regularText12.copyWith(color: greyColor),
            ),
            infoDescription(),
            buttonReadNow(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  header(),
                  SizedBox(
                    height: 15,
                  ),
                  bookImage(),
                  description(),
                ],
              ),
              saveButton(),
            ],
          )
        ],
      ),
    );
  }
}
