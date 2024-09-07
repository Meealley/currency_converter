import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_routers/home/widget/button.dart';
import 'package:go_routers/models/user.dart';
import 'package:go_routers/utils/app_textstyle.dart';

class HomeWidget extends StatelessWidget {
  final String username;
  const HomeWidget({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Page $username",
          style: AppTextStyles.headingBold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Text(
              "Good morning $username, I can see that no one is going to open the door and i will keep pushing till i break it up!",
              style: AppTextStyles.bodyText,
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonPress(
              text: "Click to Profile",
              onPressed: () {
                context.pushNamed(
                  "/profile",
                  extra: User(
                      name: "Optimus Autobot",
                      imageUrl: "assets/images/autobot.png",
                      synopsis:
                          "The conflict centers around the AllSpark, a powerful artifact capable of creating life, which both sides seek. As the battle intensifies, Sam and his new friend Mikaela (played by Megan Fox) must help the Autobots prevent the Decepticons from using the AllSpark to conquer Earth. The film is packed with intense action sequences, groundbreaking visual effects, and the theme of good versus evil, all while exploring the bond between humans and their new robotic allies."),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonPress(
              text: "Click to Categories",
              onPressed: () {
                context.pushNamed('/categories', pathParameters: {
                  'category': "320082038",
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonPress(
              text: "Clict to calculate your money",
              onPressed: () {
                context.push('/calculate');
              },
            ),
          ],
        ),
      ),
    );
  }
}
