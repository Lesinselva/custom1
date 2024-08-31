import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImagePicker extends StatefulWidget {
  final void Function(File? image) onImagePicked;
  final String username;
  final String number;
  final IconData pickericon;
  final IconData conIcon;

  const ProfileImagePicker(
      {super.key,
      required this.onImagePicked,
      required this.username,
      required this.number,
      required this.pickericon,
      required this.conIcon});

  @override
  _ProfileImagePickerState createState() => _ProfileImagePickerState();
}

class _ProfileImagePickerState extends State<ProfileImagePicker> {
  File? _image;

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
      widget.onImagePicked(_image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: _image != null ? FileImage(_image!) : null,
              child: IconButton(
                icon: Icon(widget.pickericon),
                onPressed: pickImage,
              ),
            ),
            Positioned(
              bottom: 3,
              right: 3,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 43, 95, 138),
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(4),
                child: Icon(
                  widget.conIcon,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Column(
          children: [
            Text(
              widget.username,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(widget.number),
          ],
        ),
      ],
    );
  }
}
