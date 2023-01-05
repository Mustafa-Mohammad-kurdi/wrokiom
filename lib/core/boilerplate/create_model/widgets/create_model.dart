import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../constants/appcolors.dart';
import '../../../widgets/prints/print.dart';
import '../cubits/create_model_cubit.dart';

typedef void CreatedCallback(CreateModelCubit cubit);
typedef ModelCreated<Model> = Function(Model model);

class CreateModel<Model> extends StatefulWidget {
  final ModelCreated<Model>? onSuccess;
  final double? loadingHeight;
  final RepositoryCallBack? repositoryCallBack;
  final CreatedCallback? onCubitCreated;
  final Widget child;

  const CreateModel(
      {Key? key,
      this.repositoryCallBack,
      this.onCubitCreated,
      required this.child,
      this.onSuccess,
      this.loadingHeight})
      : super(key: key);

  @override
  State<CreateModel<Model>> createState() => _GetModelState<Model>();
}

class _GetModelState<Model> extends State<CreateModel<Model>> {
  CreateModelCubit<Model>? cubit;

  void initState() {
    cubit = CreateModelCubit<Model>(widget.repositoryCallBack!);
    if (widget.onCubitCreated != null) {
      widget.onCubitCreated!(cubit!);
    }
    //cubit.createModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateModelCubit, CreateModelState>(
      bloc: cubit,
      builder: (context, state) {
        if (widget.onCubitCreated != null) {
          widget.onCubitCreated!(cubit!);
        }


        if (state is CreateModelInitial)
          return widget.child;
        else if (state is Loading) {
          return Shimmer.fromColors(

            baseColor: AppColors.primary[300]!,
            highlightColor: AppColors.primary[100]!,
            child: widget.child,
          );
          return Container(
              height: widget.loadingHeight,
              child: Center(child: CupertinoActivityIndicator()));
        } else {
          if (state is CreateModelSuccessfully) {
          return widget.child;
        }

        // else if (state is Error ){
        //   return ConnectionErrorWidget(
        //     message: state.message,
        //     onTap: (){
        //       cubit.createModel( );
        //     },
        //   );
        // }
        else
          return widget.child!;
        }
      },
      listener: (context, state) {
        if (state is CreateModelSuccessfully) widget.onSuccess!(state.model);
        if (state is Error) {
          Print.showSnackBar(
              message: state.message.toString(),
              typeSnackBar: AnimatedSnackBarType.error);
          //  ScaffoldMessenger.of(context).showSnackBar(snackBar(state.message));
        }
      },
    );
  }
}
