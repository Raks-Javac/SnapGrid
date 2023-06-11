import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:snap_grid/src/core/network/network.dart';
import 'package:snap_grid/src/features/home/data/models/photo_model.dart';
import 'package:snap_grid/src/features/home/provider/home_provider.dart';

void main() {
  testWidgets('HomeScreen displays grid view of PhotoModels',
      (WidgetTester tester) async {
    // // Arrange
    // final fakePhotoModels = [
    //   PhotoModel(
    //     id: '1',
    //     title: 'PhotoModel 1',
    //     imageUrl: 'https://example.com/PhotoModel1.jpg',
    //     description: 'Description 1',
    //     author: 'Author 1',
    //   ),
    //   // Add more sample PhotoModels as needed
    // ];

    // await tester.pumpWidget(
    //   ChangeNotifierProvider(
    //     create: (_) => MockPhotoProvider(ptModels: fakePhotoModels,),
    //     child: const MaterialApp(home: HomeView()),
    //   ),
    // );

    // Assert
    expect(find.byType(CircularProgressIndicator),
        findsNothing); // Loading indicator should not be present
    // expect(find.byType(GridTile),
    //     findsNWidgets(fakePhotoModels.length)); // Grid tiles should be present
    expect(find.text('PhotoModel 1'),
        findsOneWidget); // PhotoModel title should be present
  });
}

class MockPhotoProvider extends ChangeNotifier implements PhotoProvider {
  final List<PhotoModel> ptModels;
  final int page;
  final int perPage;

  MockPhotoProvider(
      {required this.ptModels, required this.page, required this.perPage});

  @override
  List<PhotoModel> get getphotos => ptModels;

  @override
  bool get isLoading => false;

  @override
  Future<void> fetchPhotos() async {}

  @override
  AppNetwork appNetwork = AppNetwork();

  @override
  int get getPage => page;

  @override
  int get getPerPage => perPage;

  @override
  String get errorMessage => "";

  @override
  bool get hasError => false;

  @override
  fetchMoreImages() {
    throw UnimplementedError();
  }

  @override
  bool shouldFetchMore = false;

  @override
  Future<void> downloadImage(String downloadUrl) {
    throw UnimplementedError();
  }

  @override
  int previousCount = 10;
}
