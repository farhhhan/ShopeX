import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopex/user_logindb/userlogin.dart';

class EditProfileScreen extends StatefulWidget {
  final User? currentUser;

  const EditProfileScreen({Key? key, required this.currentUser})
      : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  String? _selectedImage;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    // Initialize text controllers with current user data
    nameController.text = widget.currentUser!.name;
    emailController.text = widget.currentUser!.email;
    numberController.text = widget.currentUser!.number;
    _selectedImage = widget.currentUser!.image;
  }

  void _selectImage1() async {
    final selectedimg1 =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (selectedimg1 != null) {
      setState(() {
        _selectedImage = selectedimg1.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Icon(Icons.restore))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InkWell(
              onTap: _selectImage1,
              child: CircleAvatar(
                radius: 90,
                backgroundImage: widget.currentUser!.image != null
                    ? FileImage(File(_selectedImage!))
                    : null,
                child: _selectedImage == null
                    ? Image.asset('images/prf.jpeg')
                    : null,
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: numberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Save the edited profile data
          updateProfile(
            _selectedImage!,
            nameController.text,
            numberController.text,
          );
          // Update the product in Hive

          // Pop the screen to go back to the profile screen
          Navigator.pop(context);
        },
        child: Icon(Icons.save),
      ),
    );
  }

  void updateProfile(String imagePath, String newName, String newNumber) {
    // Assuming you have a Hive box for users
    final userBox = Hive.box<User>('users');

    // Get the current user from the box
    User currentUser = userBox.values.firstWhere(
      (user) => user.email == widget.currentUser!.email,
    );

    // Update the user's profile information
    currentUser.image = imagePath;
    currentUser.name = newName;
    currentUser.number = newNumber;

    // Save the updated user back to the box
    userBox.put(currentUser.key, currentUser);

    // If needed, you can also update the widget.currentUser with the new information
    // widget.currentUser = currentUser;
  }
}
