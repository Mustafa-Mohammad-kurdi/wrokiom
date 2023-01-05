import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:workiom/core/common/style/gaps.dart';
import 'package:workiom/core/constants/Validators.dart';
import 'package:workiom/core/constants/app_assets.dart';
import 'package:workiom/core/constants/constants.dart';
import '../../../../core/boilerplate/create_model/cubits/create_model_cubit.dart';
import '../../../../core/boilerplate/create_model/widgets/create_model.dart';
import '../../../../core/constants/AppColors.dart';
import '../../../../core/constants/AppTheme.dart';
import '../../../../core/utils/Navigation/Navigation.dart';
import '../../../../core/widgets/IconAppbar.dart';
import '../../../../core/widgets/appbar/GeneralAppBar.dart';
import '../../../../core/widgets/forms/RoundedTextField.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../data/request/authenticate_request_model.dart';
import '../../data/response/authenticate_response_model.dart';
import '../../data/response/register_tenant_response_model.dart';
import '../../domain/repo/user_repository.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/footer_widget.dart';
import '../widgets/header_widget.dart';

class LoginWithEmailPage extends StatefulWidget {
  const LoginWithEmailPage({Key? key}) : super(key: key);
  @override
  _LoginWithEmailPageState createState() => _LoginWithEmailPageState();
}

class _LoginWithEmailPageState extends State<LoginWithEmailPage> {
  TextEditingController tenantController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  late GlobalKey<FormState> _formKey;
  RegisterTenantResponseModel responseModel = RegisterTenantResponseModel();

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    if(GetIt.I<RegisterTenantResponse>().registerTenantResponseModel != null) {
      responseModel = GetIt.I<RegisterTenantResponse>().registerTenantResponseModel!;
      tenantController = TextEditingController(text: responseModel.tenancyName);
       emailController = TextEditingController(text: responseModel.emailAddress);
       passController = TextEditingController();
    }
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Gaps.vGap1,
                HeaderWidget(title: "Login"),
                Gaps.vGap8,
                CustomTextField(
                  prefixImage: AppAssets.public,
                  textField: RoundedTextField(
                    controller: tenantController,
                    validator: Validators.validateTenant,
                    onChange: (value) {
                    },
                    hintText: "Workspace name*",
                    suffix: Text(".workiom.com",style: AppTheme.headline3),
                  ),
                  title: 'Your company or team name',
                ),
                CustomTextField(
                  prefixImage: AppAssets.email,
                  textField: RoundedTextField(
                    controller: emailController,
                    onChange: (value) {
                      setState(() {
                        // registerTenant.adminEmailAddress = value;
                      });
                    },
                    validator: Validators.validateEmail,
                    hintText: "Enter your Email",
                    suffixIcon: InkWell(
                      onTap: () {
                        // registerTenant.adminEmailAddress = "";
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
                          // registerTenant.adminPassword = value;
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
                Gaps.vGap8,
                _buildNextButton(),
                Gaps.vGap8,
                FooterWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }



  late CreateModelCubit loginCubit;
  _buildNextButton() {
    return CreateModel<AuthenticateResponseModel>(
      onCubitCreated: (cubit) => loginCubit = cubit,
      repositoryCallBack: (data) => UserRepository.authenticate(data),
      onSuccess: (AuthenticateResponseModel responseModel) {

      },
      child: PrimaryButton(
          onClick: () async {
            AuthenticateRequestModel authenticateRequestModel = AuthenticateRequestModel(
              ianaTimeZone: DateTime.now().timeZoneName,
              password: passController.text,
              rememberClient: false,
              tenantName: tenantController.text,
              userNameOrEmailAddress: emailController.text
            );
            if ( loginCubit != null) {
              loginCubit.createModel(authenticateRequestModel);
              // context.read<UserCubit>().otpLogin(phoneController.text);
              // Migration.migrateSpecialities();
              //  loginStore.getCodeWithPhoneNumber(context, phoneController.text.toString());
            } else {}
          },
          chip: true,
          buttonColor: AppColors.primary,
          withIcon: false,
          textButton: "Create Workspace".tr()),
    );
  }
}
