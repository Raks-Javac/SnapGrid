import 'package:flutter/material.dart';
import 'package:snap_grid/src/core/network/network.dart';
import 'package:snap_grid/src/features/home/data/models/photo_model.dart';
import 'package:snap_grid/src/features/home/repository/photo_repository.dart';

class PhotoProvider extends ChangeNotifier {
  //
  AppNetwork appNetwork;
  //
  PhotoProvider(this.appNetwork);
  //
  List<PhotoModel> _photos = [];
  final int _page = 1;
  int _perPage = 10;
  bool _isLoading = false;

  List<PhotoModel> get getphotos => _photos;
  bool get isLoading => _isLoading;
  int get getPage => _page;
  int get getPerPage => _perPage;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;
  bool _hasError = false;
  bool get hasError => _hasError;
  int previousCount = 10;

  //fetch more photos
  bool shouldFetchMore = false;
  fetchMoreImages() async {
    previousCount = _perPage;

    //activate the fetch more loader
    shouldFetchMore = true;
    notifyListeners();

    //adds 10 more images on that page
    _perPage += 10;

    // since we are still on the same page we dont need to increment the page
    notifyListeners();

    //

    try {
      final fetchPhotosFromRepository =
          await PhotoRepository(appNetwork).fetchPhotos(_page, _perPage);

      List<PhotoModel> newPhotos = fetchPhotosFromRepository;
      List<PhotoModel> emptyList = [];

      //Remove the previously incremented 10 items from the existing list
      for (int i = 0; i < newPhotos.length; i++) {
        if (i > previousCount) {
          emptyList.add(newPhotos[i]);
        }
      }
      // Add the new items to the existing list using spread operator
      _photos = [..._photos, ...emptyList];
      shouldFetchMore = false;
      previousCount = _perPage;
      notifyListeners();
    } catch (error) {
      shouldFetchMore = false;
      _hasError = true;
      _errorMessage = error.toString();
      notifyListeners();
      rethrow;
    }
  }

//fetch photos
  Future<void> fetchPhotos() async {
    try {
      _isLoading = true;
      notifyListeners();
      final fetchPhotosFromRepository =
          await PhotoRepository(appNetwork).fetchPhotos(_page, _perPage);
      List<PhotoModel> newPhotos = fetchPhotosFromRepository;

      _photos = newPhotos;
      _isLoading = false;
      notifyListeners();
    } catch (error) {
      _isLoading = false;
      _hasError = true;
      _errorMessage = error.toString();
      notifyListeners();
      rethrow;
    }
  }

  //download image
  Future<void> downloadImage(String downloadUrl) async {
    try {
      await PhotoRepository(appNetwork)
          .downloadPhotoFromDownloadUrl(downloadUrl);
    } catch (e) {
      print(e.toString());
      _errorMessage = e.toString();
      notifyListeners();
    }
  }
}
