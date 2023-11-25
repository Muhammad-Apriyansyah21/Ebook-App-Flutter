import 'package:flutter/material.dart';
import 'package:flutter_ebook_app/themes.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'User Page',
        style: semiBoldText20,
      )),
    );
  }
}
