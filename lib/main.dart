import 'package:flutter/material.dart';
import 'package:flutter_ebook_app/screens/bottom_nav_bar.dart';
import 'package:flutter_ebook_app/screens/home/home_page.dart';
import 'package:flutter_ebook_app/screens/home/pages/book_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BukuKu-21.id App",
      debugShowCheckedModeBanner: false,
      routes: {
        BottomNavBar.nameRoute: (context) => BottomNavBar(),
        HomePage.nameRoute: (context) => HomePage(),
        BookDetail.nameRoute: (context) => BookDetail(),
      },
    );
  }
}
