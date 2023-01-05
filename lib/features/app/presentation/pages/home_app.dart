import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/Keys.dart';
import '../../../../core/widgets/appbar/GeneralAppBar.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../widgets/drawer_widget.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  _HomeAppState createState() => _HomeAppState();
}


class _HomeAppState extends State<HomeApp> {
  @override
  void initState() {
    super.initState();
    Keys.scaffoldKey = GlobalKey<ScaffoldState>();
  }
 // TODO here init BottomNavBar or Drawer or Tapbar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(title: "Home Page",withMenu: true),
      key: Keys.scaffoldKey,
      drawerEdgeDragWidth: 5.0.w,
      drawer: DrawerWidget(),
      body: HomePage(),
    );
  }

}