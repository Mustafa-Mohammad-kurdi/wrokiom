import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/boilerplate/get_model/widgets/get_model.dart';
import '../../../../core/common/style/gaps.dart';
import '../../../../core/constants/AppTheme.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../auth/data/response/get_current_login_information_response_model.dart';
import '../../domain/repo/splash_repository.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  @override
  void initState() {
    _getPackage();
    super.initState();
  }
  _getPackage() async {
    await SplashRepository.getPackage();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
          body: Column(
            children: [
              Gaps.vGap24,
              Center(
                child: GetModel<GetCurrentLoginInformationResponse>(
                  onSuccess: (GetCurrentLoginInformationResponse model) async {
                    // startTimer();
                  },
                  repositoryCallBack: (data) => SplashRepository.getSplash(),
                  loading: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Lottie.asset(
                        AppAssets.splash,
                        width: 60.w,
                      ),
                      Gaps.vGap1,
                      Text(
                        "Version".tr() + " ${SplashRepository.version!}",
                        style: AppTheme.caption.copyWith(fontSize: 12),
                      )
                    ],
                  ),
                  modelBuilder: (model) {
                    return Lottie.asset(
                      AppAssets.splash,
                      width: 80.w,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
    );
  }
}
