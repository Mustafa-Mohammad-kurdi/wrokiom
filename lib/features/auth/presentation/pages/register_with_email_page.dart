import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:workiom/core/common/style/gaps.dart';
import 'package:workiom/core/constants/app_assets.dart';
import 'package:workiom/core/constants/constants.dart';
import 'package:workiom/features/auth/domain/cubit/password_cubit.dart';
import 'package:workiom/features/auth/presentation/pages/welcome_page.dart';
import '../../../../core/constants/AppColors.dart';
import '../../../../core/constants/Validators.dart';
import '../../../../core/utils/Navigation/Navigation.dart';
import '../../../../core/utils/service_locator/ServiceLocator.dart';
import '../../../../core/widgets/IconAppbar.dart';
import '../../../../core/widgets/appbar/GeneralAppBar.dart';
import '../../../../core/widgets/forms/RoundedTextField.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../data/request/register_tenant_request_model.dart';
import '../../data/response/get_password_complexity_setting_response_model.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/footer_widget.dart';
import '../widgets/header_widget.dart';
import 'package:flutter_password_strength/flutter_password_strength.dart';

import '../widgets/password_state_widget.dart';
import 'complete_your_account_page.dart';

class RegisterWithEmailPage extends StatefulWidget {
  const RegisterWithEmailPage({Key? key}) : super(key: key);
  @override
  _RegisterWithEmailPageState createState() => _RegisterWithEmailPageState();
}

class _RegisterWithEmailPageState extends State<RegisterWithEmailPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  RegisterTenantRequestModel registerTenant = RegisterTenantRequestModel();


  final _formKey = GlobalKey<FormState>();
  late PasswordComplexitySetting passwordComplexitySetting ;
   int numberWarning = 1;

  @override
  void initState() {
    GetIt.I<RegisterTenantRequest>().registerTenantRequestModel = registerTenant;
    passwordComplexitySetting =
    GetIt.I<GetPasswordComplexitySettingResponseModel>().setting!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(
        title: "",
        leading: IconAppbar(),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: BlocListener<PasswordCubit, PasswordState>(
          bloc: GetIt.I<CubitsStore>().passwordCubit,
          listener: (context, state) {
            if(state is NumberWarning) numberWarning = state.numberWarning;
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Gaps.vGap1,
                  HeaderWidget(title: "Enter a strong password"),
                  Gaps.vGap8,
                  CustomTextField(
                    prefixImage: AppAssets.email,
                    textField: RoundedTextField(
                      controller: emailController,
                      onChange: (value) {
                        setState(() {
                          registerTenant.adminEmailAddress = value;
                        });
                      },
                      validator: Validators.validateEmail,
                      hintText: "Enter your Email",
                      suffixIcon: InkWell(
                        onTap: () {
                          registerTenant.adminEmailAddress = "";
                          emailController.clear();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            AppAssets.x_circle,
                            height: 1.5.w,
                          ),
                        ),
                      ),
                    ),
                    title: 'Your work email',
                  ),
                  CustomTextField(
                    prefixImage: AppAssets.password,
                    textField: RoundedTextField(
                        controller: passController,
                        isPassword: true,
                        onChange: (value) {
                          setState(() {
                            GetIt.I<CubitsStore>().passwordCubit!.changePassword(value);
                            registerTenant.adminPassword = value;
                          });
                        },
                        // validator: Validators.validatePassword,
                        hintText: "Enter your Password",
                        suffixIcon: Padding(
                          padding:  EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            AppAssets.see_password,
                            height: 1.5.w,
                          ),
                        )),
                    title: 'Your password',
                  ),
                  Gaps.vGap1,
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      width: 95.w,
                      child: FlutterPasswordStrength(
                        radius: 50.h,
                        height: 0.8.h,
                        password:  registerTenant.adminPassword,
                        strengthCallback: (strength) {
                          debugPrint(strength.toString());
                        },
                      ),
                    ),
                  ),
                  Gaps.vGap2,
                  PasswordStateWidget(isLarge: true, text: "Not enought strong",index: 0),
                  PasswordStateWidget(isLarge: false, text: "Passwords must have at least ${passwordComplexitySetting.requiredLength!} characters",index:1),
                  if(passwordComplexitySetting.requireDigit!)
                    PasswordStateWidget(isLarge: false, text: "Passwords must have at least one Digit ('0'-'9').",index: 2),
                  if(passwordComplexitySetting.requireUppercase!)
                    PasswordStateWidget(isLarge: false, text: "Passwords must have at least one Uppercase ('A'-'Z').",index: 3),
                  if(passwordComplexitySetting.requireLowercase!)
                    PasswordStateWidget(isLarge: false, text: "Passwords must have at least one Lowercase ('a'-'z').",index: 4),
                  if(passwordComplexitySetting.requireNonAlphanumeric!)
                    PasswordStateWidget(isLarge: false, text: "Passwords must have at least one symbol.",index: 5),
                  Gaps.vGap5,
                  _buildNextButton(),
                  Gaps.vGap8,
                  FooterWidget()
                ],
              ),
            ),
          ),
        ),

      ),
    );
  }



  _buildNextButton() {
    bool isNext = (numberWarning == 0 && _formKey.currentState!.validate());
    return PrimaryButton(
        onClick: ()  async{
          if(isNext){
            GetIt.I<RegisterTenantRequest>().registerTenantRequestModel = registerTenant;
            Navigation.push(CompleteYourAccountPage());
          }
        },
        chip: true,
        buttonColor: isNext ?  AppColors.primary : AppColors.darkerText,
        withIcon: false,
        textButton: "Confirm password".tr());
  }

}


