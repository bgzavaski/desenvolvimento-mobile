import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  static const instagramBlue = Color(0xFF3897F0);

  final name = TextEditingController(text: 'Jacob West');
  final username = TextEditingController(text: 'jacob_w');
  final website = TextEditingController();
  final bio = TextEditingController(
    text: 'Digital goodies designer @pixelslz\nEverything is designed.',
  );
  final email = TextEditingController(text: 'jacob.west@gmail.com');
  final phone = TextEditingController(text: '+1 202 555 0147');
  final gender = TextEditingController(text: 'Male');

  @override
  void dispose() {
    name.dispose();
    username.dispose();
    website.dispose();
    bio.dispose();
    email.dispose();
    phone.dispose();
    gender.dispose();
    super.dispose();
  }

  void saveProfile() {
    FocusScope.of(context).unfocus();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profile updated'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void cancel() {
    FocusScope.of(context).unfocus();
    if (Navigator.of(context).canPop()) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFAFA),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leadingWidth: 72,
        leading: TextButton(
          onPressed: cancel,
          child: const Text(
            'Cancel',
            style: TextStyle(color: Color(0xFF262626), fontSize: 14),
          ),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: Color(0xFF262626),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          TextButton(
            onPressed: saveProfile,
            child: const Text(
              'Done',
              style: TextStyle(
                color: instagramBlue,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 4),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, color: Color(0xFFEFEFEF)),
        ),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 18),
              Center(
                child: ClipOval(
                  child: SizedBox(
                    width: 86,
                    height: 86,
                    child: Image.network(
                      'https://static.significados.com.br/foto/pessoa-og.jpg?class=ogImageRectangle',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const ColoredBox(
                            color: Color(0xFFEFEFEF),
                            child: Icon(
                              Icons.person,
                              size: 48,
                              color: Color(0xFFBDBDBD),
                            ),
                          ),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: instagramBlue,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  textStyle: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                child: const Text('Change Profile Photo'),
              ),
              const SizedBox(height: 4),
              const Divider(height: 1, color: Color(0xFFEFEFEF)),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 2, 16, 0),
                child: Column(
                  children: [
                    ProfileField(label: 'Name', controller: name),
                    ProfileField(label: 'Username', controller: username),
                    ProfileField(
                      label: 'Website',
                      controller: website,
                      hintText: 'Website',
                      keyboardType: TextInputType.url,
                    ),
                    ProfileField(label: 'Bio', controller: bio, maxLines: 2),
                  ],
                ),
              ),
              const Divider(height: 1, color: Color(0xFFEFEFEF)),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  alignment: Alignment.centerLeft,
                  foregroundColor: instagramBlue,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 15,
                  ),
                  shape: const RoundedRectangleBorder(),
                ),
                child: const Text(
                  'Switch to Professional Account',
                  style: TextStyle(fontSize: 13),
                ),
              ),
              const Divider(height: 1, color: Color(0xFFEFEFEF)),
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 19, 16, 9),
                child: Text(
                  'Private Information',
                  style: TextStyle(
                    color: Color(0xFF262626),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    ProfileField(
                      label: 'Email',
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    ProfileField(
                      label: 'Phone',
                      controller: phone,
                      keyboardType: TextInputType.phone,
                    ),
                    ProfileField(
                      label: 'Gender',
                      controller: gender,
                      textInputAction: TextInputAction.done,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileField extends StatelessWidget {
  const ProfileField({
    super.key,
    required this.label,
    required this.controller,
    this.hintText,
    this.maxLines = 1,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
  });

  final String label;
  final TextEditingController controller;
  final String? hintText;
  final int maxLines;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 86,
            child: Padding(
              padding: const EdgeInsets.only(top: 14),
              child: Text(
                label,
                style: const TextStyle(
                  color: Color(0xFF262626),
                  fontSize: 13,
                ),
              ),
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              maxLines: maxLines,
              keyboardType: keyboardType,
              textInputAction: textInputAction,
              style: const TextStyle(
                color: Color(0xFF262626),
                fontSize: 13,
                height: 1.25,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(color: Color(0xFFC7C7CD)),
                isDense: true,
                contentPadding: const EdgeInsets.fromLTRB(0, 13, 0, 12),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFEFEFEF)),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFBDBDBD)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
