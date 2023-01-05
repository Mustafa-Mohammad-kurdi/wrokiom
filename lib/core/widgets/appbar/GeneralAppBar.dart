import 'package:flutter/material.dart';
import '../../constants/AppColors.dart';
import '../../constants/AppTheme.dart';
import '../../constants/Keys.dart';
import '../../constants/constants.dart';


class GeneralAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool withMenu;

  const GeneralAppBar(
      {Key? key, required this.title, this.actions, this.leading, this.withMenu = false})
      : super(key: key);

  void _toggle() {
    Keys.scaffoldKey?.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: AppColors.blackText),
      centerTitle: true,
      title: Text(title, style: AppTheme.headline1),
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 110,
      leading: Align(
        alignment: isEnglish() ? Alignment.centerLeft : Alignment.centerRight,
        child: !withMenu ?  leading : IconButton(
          onPressed: () => _toggle(),
          icon: Icon(Icons.subject, color: AppColors.primary),
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
