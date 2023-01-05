import 'package:flutter/material.dart';

import '../constants/AppColors.dart';
import '../constants/constants.dart';
import '../utils/Navigation/Navigation.dart';

class IconAppbar extends StatelessWidget {
  const IconAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isEnglish() ? Alignment.centerLeft : Alignment.centerRight,
      child: IconButton(
        onPressed: () => Navigation.pop(),
        icon: Icon(Icons.arrow_back_ios, color: AppColors.primary),
      ),
    );
  }
}
