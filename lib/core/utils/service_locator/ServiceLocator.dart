import 'package:get_it/get_it.dart';

import '../../../features/auth/data/request/authenticate_request_model.dart';
import '../../../features/auth/data/request/register_tenant_request_model.dart';
import '../../../features/auth/data/response/get_password_complexity_setting_response_model.dart';
import '../../../features/auth/data/response/register_tenant_response_model.dart';
import '../../../features/auth/domain/cubit/password_cubit.dart';

class ServiceLocator {
  static void registerModels() {
    GetIt.I.registerLazySingleton<GetPasswordComplexitySettingResponseModel>(() => GetPasswordComplexitySettingResponseModel());
    GetIt.I.registerLazySingleton<CubitsStore>(() => CubitsStore());
    GetIt.I.registerLazySingleton<RegisterTenantRequest>(() => RegisterTenantRequest());
    GetIt.I.registerLazySingleton<RegisterTenantResponse>(() => RegisterTenantResponse());
  }
}

class CubitsStore{
  PasswordCubit? passwordCubit;
  CubitsStore();
}
