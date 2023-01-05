import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:workiom/core/common/style/gaps.dart';
import 'package:workiom/core/constants/Validators.dart';
import 'package:workiom/core/constants/app_assets.dart';
import 'package:workiom/core/constants/constants.dart';
import 'package:workiom/core/utils/shared_preferences/SharedPreferencesHelper.dart';
import '../../../../core/boilerplate/create_model/cubits/create_model_cubit.dart';
import '../../../../core/boilerplate/create_model/widgets/create_model.dart';
import '../../../../core/constants/AppColors.dart';
import '../../../../core/constants/AppTheme.dart';
import '../../../../core/utils/Navigation/Navigation.dart';
import '../../../../core/utils/debouncer.dart';
import '../../../../core/widgets/IconAppbar.dart';
import '../../../../core/widgets/appbar/GeneralAppBar.dart';
import '../../../../core/widgets/forms/RoundedTextField.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../data/request/register_tenant_request_model.dart';
import '../../data/response/is_tenant_available_response_model.dart';
import '../../data/response/register_tenant_response_model.dart';
import '../../domain/repo/user_repository.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/footer_widget.dart';
import '../widgets/header_widget.dart';

class CompleteYourAccountPage extends StatefulWidget {
  const CompleteYourAccountPage({Key? key}) : super(key: key);
  @override
  _CompleteYourAccountPageState createState() => _CompleteYourAccountPageState();
}

class _CompleteYourAccountPageState extends State<CompleteYourAccountPage> {
  TextEditingController tenantController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
   late GlobalKey<FormState> _formKey;
  final _debouncer = Debouncer(milliseconds: 900);
  RegisterTenantRequestModel requestTenant = RegisterTenantRequestModel();
  bool isValidTenant = false;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    requestTenant =   GetIt.I<RegisterTenantRequest>().registerTenantRequestModel!;
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
                HeaderWidget(title: "Enter a strong password"),
                Gaps.vGap8,
                CustomTextField(
                  prefixImage: AppAssets.public,
                  textField: RoundedTextField(
                    controller: tenantController,
                    error: isValidTenant,
                    validator: Validators.validateTenant,
                    onChange: (value) {
                      _debouncer.run(() async{
                        if (value.isEmpty) {

                        } else {
                          var isTenantAvailable = await UserRepository.isTenantAvailable(value);
                          if(isTenantAvailable is IsTenantAvailableResponseModel){
                            requestTenant.tenancyName =  requestTenant.name = value;
                            setState(() {
                              isTenantAvailable.tenantId == null ? (isValidTenant = false) :(isValidTenant= true);
                            });
                          }
                        }
                      });
                    },
                    hintText: "Workspace name*",
                    suffix: Text(".workiom.com",style: AppTheme.headline3),
                  ),
                  title: 'Your  company or team name',
                ),
                CustomTextField(
                  prefixImage: AppAssets.text,
                  textField: RoundedTextField(
                    validator: Validators.validateEmptyValue,
                    controller: firstNameController,
                    onChange: (value) {
                      requestTenant.adminFirstName = value;
                    },
                      hintText: "Enter your name",
                  ),
                  title: 'Your first name',
                ),
                CustomTextField(
                  prefixImage: AppAssets.text,
                  textField: RoundedTextField(
                    controller: lastNameController,
                    validator: Validators.validateEmptyValue,
                    hintText: "Enter your name",
                    onChange: (value) {
                      requestTenant.adminLastName = value;
                    },
                  ),
                  title: 'Your last name',
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
    return CreateModel<RegisterTenantResponseModel>(
      onCubitCreated: (cubit) => loginCubit = cubit,
      repositoryCallBack: (data) => UserRepository.registerTenant(data),
      onSuccess: (RegisterTenantResponseModel responseModel) {

      },
      child: PrimaryButton(
          onClick: () async {
            if (!isValidTenant && loginCubit != null) {
              requestTenant.editionId = AppSharedPreferences.accessEditionStandardId;
              requestTenant.name = requestTenant.tenancyName =  tenantController.text;
              loginCubit.createModel(requestTenant);
              // context.read<UserCubit>().otpLogin(phoneController.text);
              // Migration.migrateSpecialities();
              //  loginStore.getCodeWithPhoneNumber(context, phoneController.text.toString());
            } else {}
          },
          chip: true,
          buttonColor: isValidTenant ? AppColors.darkerText : AppColors.primary,
          withIcon: false,
          textButton: "Create Workspace".tr()),
    );
  }
}
