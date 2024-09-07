import 'package:flutter/material.dart';
import 'package:go_routers/models/user.dart';
import 'package:go_routers/profile/widgets/profile_widgets.dart';

class ProfileScreen extends StatefulWidget {
  final User user;
  const ProfileScreen({super.key, required this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ProfileWidget(
      title: widget.user.name,
      imageUrl: widget.user.imageUrl,
      synopsis: widget.user.synopsis,
    );
  }
}
