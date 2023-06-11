import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:snap_grid/src/core/extensions/context_extensions.dart';
import 'package:snap_grid/src/core/extensions/widget_extensions.dart';
import 'package:snap_grid/src/core/navigation/nav_export.dart';
import 'package:snap_grid/src/features/home/data/models/photo_model.dart';
import 'package:snap_grid/src/features/home/provider/home_provider.dart';
import 'package:snap_grid/src/shared/resources/res.dart';
import 'package:snap_grid/src/shared/widgets/network_image.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final PhotoModel photoData =
        ModalRoute.of(context)!.settings.arguments as PhotoModel;
    return Scaffold(
      body: Consumer<PhotoProvider>(builder: (context, photoProvider, _) {
        return SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 295.h,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SgWidgetsCachedNetworkImage(
                            url: photoData.urls?.full ?? "",
                            width: context.width,
                            height: 295.h,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: context.theme.primaryColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  "${photoData.width} x ${photoData.height}",
                                  style: context.textTheme.bodySmall!.copyWith(
                                    color: SgColors.neutralBackgroundColor,
                                  ),
                                ).paddingAll(8),
                              ).paddingAll(15),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: SgColors.neutralBackgroundColor,
                    foregroundColor: SgColors.neutralBackgroundColor,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        SgNavigator.pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: SgColors.normalBlack,
                      ),
                      iconSize: 20,
                    ).center.paddingOnly(left: 5),
                  ).paddingSymmetric(horizontal: 20, vertical: 15),
                ],
              ),
              Expanded(
                  child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    addVerticalSpacing(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Author",
                          style: context.textTheme.bodyMedium,
                        ),
                        addVerticalSpacing(3),
                        Text(
                          photoData.user?.name ?? "",
                          style: context.textTheme.titleSmall,
                        ),
                        addVerticalSpacing(19),
                        if (photoData.description != null ||
                            photoData.altDescription != null)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Description",
                                style: context.textTheme.bodyMedium,
                              ),
                              addVerticalSpacing(3),
                              Text(
                                "${photoData.description ?? photoData.altDescription!} ",
                                style: context.textTheme.titleSmall,
                              ),
                              addVerticalSpacing(12),
                            ],
                          ),
                        Text(
                          "Likes",
                          style: context.textTheme.bodyMedium,
                        ),
                        addVerticalSpacing(3),
                        Text(
                          "${photoData.likes}",
                          style: context.textTheme.titleSmall,
                        ),
                        addVerticalSpacing(12),
                      ],
                    ).paddingSymmetric(horizontal: 20, vertical: 10)
                  ],
                ),
              )),
              // GestureDetector(
              //     onTap: () {
              //       photoProvider
              //           .downloadImage(photoData.links?.download ?? "");
              //     },
              //     child: Container(
              //       width: double.infinity,
              //       height: 42.h,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(100),
              //         color: context.theme.primaryColor,
              //       ),
              //       child: Text(
              //         "Save Image",
              //         style: context.textTheme.bodyMedium!.copyWith(
              //           color: SgColors.neutralBackgroundColor,
              //         ),
              //       ).center,
              //     )).marginSymmetric(vertical: 10, horizontal: 10)
            ],
          ).paddingSymmetric(
            horizontal: 10,
            vertical: 20,
          ),
        );
      }),
    );
  }
}
