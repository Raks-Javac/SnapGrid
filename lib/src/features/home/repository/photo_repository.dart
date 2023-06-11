import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:snap_grid/src/core/network/network.dart';
import 'package:snap_grid/src/features/home/data/models/photo_model.dart';

//an interface of the repository , which can also be mocked when writing unit test
abstract class AbstractPhotoRepository {
  Future<List<PhotoModel>> fetchPhotos(int page, int perPage);
  Future<void> downloadPhotoFromDownloadUrl(String url);
}

class PhotoRepository implements AbstractPhotoRepository {
  AppNetwork appNetwork;
  PhotoRepository(this.appNetwork);

  @override
  Future<List<PhotoModel>> fetchPhotos(int page, int perPage) async {
    final getPhotoRequest = await appNetwork.getRequest(
        "https://api.unsplash.com/photos?page=$page&per_page=$perPage");
    return photoModelFromJson(getPhotoRequest);
  }

  @override
  Future<void> downloadPhotoFromDownloadUrl(String imageUrl) async {
    final response = await appNetwork.getOrdinaryRequest(imageUrl);

    if (response.statusCode == 200) {
      final bytes = response.bodyBytes;
      final directory = await getTemporaryDirectory();
      final file = File('${directory.path}/image.jpg');
      await file.writeAsBytes(bytes);

      print('Image downloaded and saved!');
    } else {
      print('Failed to download image.');
    }
  }
}
