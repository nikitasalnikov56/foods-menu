import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test_work/ui/theme/app_colors.dart';

class InactiveIcons {
  static final homeIcon = SvgPicture.asset(
    'assets/icons/home.svg',
    color: AppColors.greyColor,
  );
  static final searchIcon = SvgPicture.asset(
    'assets/icons/search.svg',
    color: AppColors.greyColor,
  );
  static final bagIcon = SvgPicture.asset(
    'assets/icons/bag.svg',
    color: AppColors.greyColor,
  );
  static final profileIcon = SvgPicture.asset(
    'assets/icons/profile.svg',
    color: AppColors.greyColor,
  );
}
