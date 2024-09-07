import 'package:flutter/material.dart';
// import 'package:go_routers/models/user.dart';
import 'package:go_routers/utils/app_textstyle.dart';

class ProfileWidget extends StatelessWidget {
  final String title, imageUrl, synopsis;

  const ProfileWidget(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.synopsis});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile Page",
          style: AppTextStyles.heading,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imageUrl),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: AppTextStyles.bodyText,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              synopsis,
              style: AppTextStyles.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
