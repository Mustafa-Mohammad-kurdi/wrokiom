import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/constants/AppTheme.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/utils/service_locator/ServiceLocator.dart';
import '../../domain/cubit/password_cubit.dart';

class PasswordStateWidget extends StatefulWidget {
  final int index;
  final String text;
  final bool isLarge;
   PasswordStateWidget({Key? key, required this.text,this.isLarge = false, required this.index,}) : super(key: key);

  @override
  State<PasswordStateWidget> createState() => _PasswordStateWidgetState();
}

class _PasswordStateWidgetState extends State<PasswordStateWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      width: 100.0.w,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          widget.isLarge ? BlocConsumer<PasswordCubit, PasswordState>(
            bloc: GetIt.I<CubitsStore>().passwordCubit,
            buildWhen: (previous, current) {
              if (current is NumberWarning)
                return true;
              else
                return false;
            },
      listener: (context, state) {
        if (state is NumberWarning) {

        }
      },
      builder: (context, state) {
        if (state is NumberWarning)
          return SvgPicture.asset(state.numberWarning == 0 ? AppAssets.true_icon : AppAssets.warning);
        else
          return SvgPicture.asset(AppAssets.warning);
      },
    ) : BlocConsumer<PasswordCubit, PasswordState>(
            bloc: GetIt.I<CubitsStore>().passwordCubit,
            listener: (context, state) {
              if (state is ReValidate) {

              }
            },
            buildWhen: (previous, current) {
              if (current is ReValidate)
                return true;
              else
                return false;
            },
            builder: (context, state) {
              if (state is ReValidate)
                return SvgPicture.asset(state.validations[widget.index] ? AppAssets.false_icon : AppAssets.true_icon);
              else
                return SvgPicture.asset(AppAssets.false_icon);
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              widget.text,
              style: widget.isLarge
                  ? AppTheme.headline3.copyWith(fontWeight: FontWeight.w500)
                  : AppTheme.headline4,
            ),
          ),
        ],
      ),
    );
  }
}
