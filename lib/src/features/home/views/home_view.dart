import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:snap_grid/src/core/extensions/context_extensions.dart';
import 'package:snap_grid/src/core/extensions/widget_extensions.dart';
import 'package:snap_grid/src/core/navigation/nav_export.dart';
import 'package:snap_grid/src/features/home/provider/home_provider.dart';
import 'package:snap_grid/src/features/home/widget/photo_item.dart';
import 'package:snap_grid/src/shared/resources/res.dart';
import 'package:snap_grid/src/shared/resources/theme.dart';
import 'package:snap_grid/src/shared/widgets/grid_pallete.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ReceivePort receivePort = ReceivePort();

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      callInit();
    });
  }

  callInit() async {
    final provider = Provider.of<PhotoProvider>(context, listen: false);
    provider.fetchPhotos();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        provider.fetchMoreImages();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final appThemeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.theme.scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          "SnapGallary",
          style: context.textTheme.titleMedium,
        ),
        actions: [
          IconButton(
            onPressed: () {
              appThemeProvider.toggleThemeMode();
            },
            icon: Icon(globalAppThemeState == AppTheme.light
                ? Icons.mode_night_rounded
                : Icons.sunny),
            color: globalAppThemeState == AppTheme.light
                ? SgColors.normalBlack
                : SgColors.neutralBackgroundColor,
          ).paddingOnly(right: 10)
        ],
      ),
      body: Consumer<PhotoProvider>(builder: (context, photoProvider, _) {
        //when its in loading state
        if (photoProvider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        //when not in loading state and the it has an error
        if (!photoProvider.isLoading && photoProvider.hasError == true) {
          return RefreshIndicator(
              onRefresh: () {
                return photoProvider.fetchPhotos();
              },
              child: Center(child: Text(photoProvider.errorMessage)));
        }

        //when not in loading state and the it doesn't have an error and the photos list is not empty
        if (!photoProvider.isLoading &&
            photoProvider.hasError != true &&
            photoProvider.getphotos.isNotEmpty) {
          return RefreshIndicator(
            onRefresh: () {
              return photoProvider.fetchPhotos();
            },
            child: Column(
              children: [
                Expanded(
                  child: SgWidgetsShadowedGridView(
                    controller: _scrollController,
                    items: [
                      ...photoProvider.getphotos.map((photoItem) {
                        return PhotoItemWidget(
                          photoTitle: photoItem.user!.name!,
                          photoDescription: photoItem.altDescription ?? "",
                          photoUrl: photoItem.urls?.thumb ?? "",
                          onTap: () {
                            SgNavigator.pushNamed(
                              SgRoutes.detailsScreen,
                              arguments: photoItem,
                            );
                          },
                        );
                      }),
                    ],
                  )
                      .marginOnly(top: 30, left: 20, right: 20, bottom: 10)
                      .paddingOnly(bottom: 10),
                ),
                if (photoProvider.shouldFetchMore == true)
                  SizedBox(
                      width: 10,
                      height: 10,
                      child: CircularProgressIndicator(
                        color: context.theme.primaryColor,
                      )).marginOnly(bottom: 10),
              ],
            ),
          );
        } else {
          //when the photo list is empty
          return RefreshIndicator(
            onRefresh: () {
              return photoProvider.fetchPhotos();
            },
            child: const Center(
                child: Text(
              "No photo found for today",
            )),
          );
        }
      }),
    );
  }
}
