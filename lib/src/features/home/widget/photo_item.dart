import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_grid/src/core/extensions/context_extensions.dart';
import 'package:snap_grid/src/core/extensions/widget_extensions.dart';
import 'package:snap_grid/src/shared/resources/res.dart';
import 'package:snap_grid/src/shared/widgets/network_image.dart';

class PhotoItemWidget extends StatelessWidget {
  final String photoTitle;
  final String photoDescription;
  final String photoUrl;
  final Function() onTap;
  const PhotoItemWidget(
      {super.key,
      required this.photoTitle,
      required this.photoDescription,
      required this.photoUrl,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GestureDetector(
                onTap: () {
                  onTap();
                },
                child: SgWidgetsCachedNetworkImage(url: photoUrl)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                photoTitle,
                style: context.textTheme.titleSmall!.copyWith(
                  fontSize: 12.sp,
                ),
              ),
              addVerticalSpacing(2),
              if (photoDescription.isNotEmpty)
                SizedBox(
                  height: 30,
                  child: Text(
                    photoDescription,
                    style: context.textTheme.bodySmall!.copyWith(
                      color:
                          context.textTheme.bodySmall!.color!.withOpacity(0.6),
                      fontSize: 9.5.sp,
                    ),
                  ),
                )
            ],
          ).marginOnly(
            left: 12,
            right: 5,
            top: 8,
            bottom: 8,
          ),
        ],
      ),
    );
  }
}
