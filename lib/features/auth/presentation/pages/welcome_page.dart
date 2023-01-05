import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/common/style/gaps.dart';
import '../../../../core/constants/AppColors.dart';
import '../../../../core/constants/AppTheme.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/utils/Navigation/Navigation.dart';
import '../../../../core/widgets/appbar/GeneralAppBar.dart';
import '../../../../core/widgets/drop_down_language.dart';
import '../../../../core/widgets/primary_button.dart';
import '../widgets/footer_widget.dart';
import '../widgets/header_widget.dart';
import '../widgets/trems_of_service_and_privacy_widget.dart';
import 'register_with_email_page.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(title: "", leading: _buildIconAppbar()),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Gaps.vGap1,
              HeaderWidget(title: "Create your free account"),
              Gaps.vGap16,
              _buildButtonsAuth(),
              Gaps.vGap1,
              TremsOfServiceAndPrivacyWidget(),
              Gaps.vGap16,
              _buildFooterWidget()
            ],
          ),
        ),
      ),
    );
  }

  _buildButtonsAuth() {
    return Column(
      children: [
        PrimaryButton(
          onClick: () {},
          image: AppAssets.google,
          withIcon: true,
          textButton: "Continue with Google".tr(),
        ),
        Gaps.vGap4,
        Center(
            child: Text("Or",
                style: AppTheme.headline3
                    .copyWith(color: AppColors.greySwatch[60]))),
        Gaps.vGap4,
        PrimaryButton(
            onClick: () {
              Navigation.push(RegisterWithEmailPage());
            },
            withIcon: false,
            chip: true,
            buttonColor: AppColors.primary,
            textButton: "Continue with email".tr()),
        // TODO Confirm and discuss the recording scenario
        // Gaps.vGap1,
        // PrimaryButton(
        //     onClick: () {
        //       Navigation.push(LoginWithEmailPage());
        //     },
        //     withIcon: false,
        //     chip: true,
        //     buttonColor: AppColors.primary,
        //     textButton: "Login".tr()),
      ],
    );
  }

  _buildFooterWidget() {
    return Column(
      children: [
        InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text("Language".tr(),
                      style: AppTheme.headline2),
                  content: DropDownLanguage(),
                ));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppAssets.globe),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(isEnglish() ? "English" : "Arabic",style: AppTheme.headline3),
              ),
              Icon(Icons.arrow_drop_down_sharp,color: AppColors.darkText,)
            ],
          ),
        ),
        FooterWidget()
      ],
    );
  }

  _buildIconAppbar() {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(Icons.arrow_back_ios, color: AppColors.primary),
            Text(
              "Sign in",
              style: AppTheme.headline3.copyWith(
                  color: AppColors.primary,
                  wordSpacing: 1.5,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
