import 'package:flutter/material.dart';
import 'package:flutter_test_work/ui/components/avatar_widget/avatar_widget.dart';
import 'package:flutter_test_work/ui/theme/app_style.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account Profile',
          style: AppStyle.fontStyle,
        ),
        centerTitle: true,
        actions: const [AvatarWidget(), SizedBox(width: 16)],
        toolbarHeight: 100,
      ),
    );
  }
}

