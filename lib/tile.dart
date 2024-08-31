import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;
  final IconData? trailingIcon;

  const ProfileTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.icon,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: trailingIcon != null ? Icon(trailingIcon) : null,
      onTap: () {},
    );
  }
}
