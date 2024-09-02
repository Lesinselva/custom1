library custom;

import 'dart:io';

import 'package:flutter/material.dart';

import 'appbar.dart';
import 'profile.dart';
import 'tile.dart';

export 'appbar.dart';
export 'profile.dart';
export 'tile.dart';

class Custom {
  static CustomAppBar appBar(String title) => CustomAppBar(title: title);

  static ProfileImagePicker picker({
    required void Function(File? image) onImagePicked,
    required String username,
    required String number,
    required IconData pickericon,
    required IconData conIcon,
  }) {
    return ProfileImagePicker(
      onImagePicked: onImagePicked,
      username: username,
      number: number,
      pickericon: pickericon,
      conIcon: conIcon,
    );
  }

  static ProfileTile profile({
    required String title,
    String? subtitle,
    required IconData icon,
    IconData? trailingIcon,
  }) {
    return ProfileTile(
      title: title,
      subtitle: subtitle,
      icon: icon,
      trailingIcon: trailingIcon,
    );
  }
}
