import 'package:flutter/material.dart';
import 'package:flutter_ebook_app/models/book.dart';
import 'package:flutter_ebook_app/screens/home/components/recent_book.dart';
import 'package:flutter_ebook_app/screens/home/components/trending_book.dart';
import 'package:flutter_ebook_app/themes.dart';

class HomePage extends StatefulWidget {
  static const String nameRoute = '/homePage';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _categories = [
    'Semua Buku',
    'Komik',
    'Novel',
    'Mangga',
    'Fantasi',
  ];

  int _isSelected = 0;

  @override
  Widget build(BuildContext context) {
    // Widget Foto Profile, Nama, Ucapan, & icon menu
    Widget header() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/profile-pic.png'),
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            //Nama Text Profile
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hallo Riyan,',
                  style: semiBoldText16,
                ),
                Text(
                  'Selamat Pagi',
                  style: regularText14.copyWith(color: greyColor),
                ),
              ],
            ),
            // Icon menu
            Spacer(),
            Image.asset(
              'assets/icons/icon-menu.png',
              width: 18,
            ),
          ],
        ),
      );
    }

    // Wdiget Search Menu
    Widget searchField() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Temukan Buku Favorite Mu',
            hintStyle: mediumText12.copyWith(color: greyColor),
            fillColor: greyColorSearchField,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            isCollapsed: true,
            contentPadding: EdgeInsets.all(18),
            suffixIcon: InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: greenColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Icon(
                  Icons.search_rounded,
                  color: whiteColor,
                ),
              ),
            ),
          ),
        ),
      );
    }

    // Widget Buku Terbaru
    Widget recentBook() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            RecentBook(
              image: 'assets/images/recentbook_1.png',
              title: 'The Magic',
            ),
            SizedBox(
              width: 20,
            ),
            RecentBook(
              image: 'assets/images/recentbook_2.png',
              title: 'The Martian',
            ),
          ],
        ),
      );
    }

    // Widget Kategori
    Widget categories(int index) {
      return InkWell(
        onTap: () {
          setState(() {
            _isSelected = index;
          });
        },
        child: Container(
          margin: EdgeInsets.only(top: 15),
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          decoration: BoxDecoration(
            color: _isSelected == index ? greenColor : transparentColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            _categories[index],
            style: semiBoldText14.copyWith(
                color: _isSelected == index ? whiteColor : greyColor),
          ),
        ),
      );
    }

    // Widget List Kategori terhubung dengan kategori
    Widget listCategories() {
      return SingleChildScrollView(
        padding: EdgeInsets.only(left: 10, right: 10),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: _categories
              .asMap()
              .entries
              .map((MapEntry map) => categories(map.key))
              .toList(),
        ),
      );
    }

    // Trending Book List
    Widget trendingBook() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          children: bookLists
              .asMap()
              .entries
              .map((MapEntry map) => TrendingBook(
                    info: bookLists[map.key],
                  ))
              .toList(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                SizedBox(
                  height: 12,
                ),
                searchField(),
                SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Buku Terbaru',
                    style: semiBoldText16.copyWith(color: blackColor),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                recentBook()
              ],
            ),
          ),
          listCategories(),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 15,
            ),
            child: Text(
              'Trending Hari Ini',
              style: semiBoldText16.copyWith(color: blackColor),
            ),
          ),
          trendingBook(),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
