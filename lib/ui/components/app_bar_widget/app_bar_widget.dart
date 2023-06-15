import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test_work/ui/components/app_bar_title/appbar_title.dart';
import 'package:flutter_test_work/ui/components/avatar_widget/avatar_widget.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 20,
        right: 16,
        top: 52,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            'assets/icons/location.svg',
            width: 25,
            height: 25,
          ),
          const SizedBox(width: 8),
          const AppBarTitle(),
          const Spacer(),
          const AvatarWidget(),
        ],
      ),
    );
  }
}
