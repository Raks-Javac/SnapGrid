import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:snap_grid/src/core/network/network.dart';
import 'package:snap_grid/src/features/home/data/models/photo_model.dart';
import 'package:snap_grid/src/features/home/provider/home_provider.dart';
import 'package:snap_grid/src/features/home/views/home_view.dart';

void main() {
  testWidgets('HomeScreen displays grid view of PhotoModels',
      (WidgetTester tester) async {
    //

    // Arrange
    final List<PhotoModel> fakePhotoModels = [];

    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => MockPhotoProvider(
          1,
          10,
          ptModels: fakePhotoModels,
        ),
        child: const MaterialApp(home: HomeView()),
      ),
    );

    // Assert
    expect(find.byType(CircularProgressIndicator), findsNothing);

    findsNWidgets(fakePhotoModels.length); // Grid tiles  should be present
    expect(find.text(fakePhotoModels[0].user!.name!),
        findsOneWidget); // PhotoModel title should be present
  });
}

class MockPhotoProvider extends ChangeNotifier implements PhotoProvider {
  final List<PhotoModel> ptModels;
  final int page;
  final int perPage;

  MockPhotoProvider(
    this.page,
    this.perPage, {
    required this.ptModels,
  });

  @override
  List<PhotoModel> get getphotos => ptModels;

  @override
  bool get isLoading => false;

  @override
  Future<void> fetchPhotos() async {}

  @override
  AppNetwork appNetwork = AppNetwork();

  @override
  int get getPage => 10;

  @override
  int get getPerPage => 1;

  @override
  String get errorMessage => "";

  @override
  bool get hasError => false;

  @override
  fetchMoreImages() async {}

  @override
  bool shouldFetchMore = false;

  @override
  Future<void> downloadImage(String downloadUrl) {
    throw UnimplementedError();
  }

  @override
  int previousCount = 10;
}
