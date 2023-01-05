import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../data/response/get_password_complexity_setting_response_model.dart';
part 'password_state.dart';

class PasswordCubit extends Cubit<PasswordState> {
  PasswordCubit() : super(PasswordInitial());

  int numberWarning = 0;
  List<bool> validation =[false,false,false,false,false,false];

  changePassword(String password) async{
    await validatePassword(password);
    emit(NumberWarning(numberWarning));
    emit(ReValidate(validation));
  }


  validatePassword(String? value) {
    PasswordComplexitySetting passwordComplexitySetting = GetIt.I<GetPasswordComplexitySettingResponseModel>().setting!;
    clearData();
    if (value!.length < passwordComplexitySetting.requiredLength!) {
      numberWarning++;
      validation[1]= true;
    }
    if (passwordComplexitySetting.requireDigit!)
      if (!RegExp((r'\d')).hasMatch(value)) {
        numberWarning++;
        validation[2]= true;
      }
    if (passwordComplexitySetting.requireLowercase!)
      if (!RegExp("(?=.*[a-z])").hasMatch(value)) {
        numberWarning++;
        validation[3]= true;
      }
    if (passwordComplexitySetting.requireUppercase!)
      if (!RegExp("(?=.*[A-Z])").hasMatch(value)) {
        numberWarning++;
        validation[4]= true;
      }
    if (passwordComplexitySetting.requireNonAlphanumeric!)
      if (!RegExp((r'\W')).hasMatch(value)) {
        numberWarning++;
        validation[5]= true;
      }
  }


  clearData(){
    numberWarning = 0;
    validation =[false,false,false,false,false,false];
  }
}

