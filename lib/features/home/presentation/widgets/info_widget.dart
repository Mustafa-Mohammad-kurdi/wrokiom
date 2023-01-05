import 'package:flutter/material.dart';
import 'package:workiom/core/constants/AppColors.dart';
import 'package:workiom/core/constants/AppTheme.dart';
import 'package:workiom/core/constants/app_styles.dart';
import 'package:workiom/core/widgets/image_widgets/custom_image.dart';

class InfoWidget extends StatelessWidget {
  final String title;
  final String descriptor;
  final String image;
  final GestureTapCallback? onTap;
  const InfoWidget(
      {Key? key,
      required this.title,
      required this.descriptor,
      required this.image, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: onTap ,
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.greySwatch[0],
              borderRadius: AppStyles.borderRadius),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Row(
              children: [
                CustomImage.rectangle(
                  // width: 10.w,
                  // height: 10.w,
                  image: image,
                  isNetworkImage: false,
                  svg: true,
                ),
                SizedBox(width: 5,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppTheme.headline3 ,  overflow: TextOverflow.ellipsis,),
                    Text(descriptor,
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme.headline3
                            .copyWith(color: AppColors.primary)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
