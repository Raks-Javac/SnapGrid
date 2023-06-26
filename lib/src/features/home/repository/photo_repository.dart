import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:snap_grid/src/core/network/network.dart';
import 'package:snap_grid/src/core/utils/utils.dart';
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
    var getPhotoRequest = await appNetwork.getRequest(
      "https://api.unsplash.com/photos?page=$page&per_page=$perPage",
    );
    Logger.logInfo(getPhotoRequest);
    // if (getPhotoRequest == null) {
    //check storage and fetch from storage if the api call fails
    //   final photosReponseFromStorage =
    //       await SgLocalStorage().getPhotosFromStore();
    //   if (photosReponseFromStorage != null) {
    //     //if value from store is not null (that is the storeage is not empty)
    //     Logger.logInfo(photosReponseFromStorage);
    //     getPhotoRequest = photosReponseFromStorage;
    //   }
    // }

    // await SgLocalStorage().storePhotosFromStore(getPhotoRequest);
    return photoModelFromJson(getPhotoRequest);
  }

  @override
  Future<void> downloadPhotoFromDownloadUrl(String imageUrl) async {
    Logger.logInfo("image url $imageUrl");
    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String fileName = imageUrl.split("/").last;

    final String filePath = '$dir/$fileName.jpg';
    Logger.logInfo("file path $filePath");

    final Dio dio = Dio();
    try {
      await dio.download(
        imageUrl,
        filePath,
        onReceiveProgress: (receivedBytes, totalBytes) async {
          if (totalBytes != -1) {
            final int progress = (receivedBytes / totalBytes * 100).toInt();
            Fluttertoast.showToast(
              msg: "Download progress: $progress%",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
            );
            if (progress == 100) {
              Fluttertoast.showToast(
                msg: "Download complete!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
              );
              GallerySaver.saveImage(filePath, toDcim: true);
            }
          }
        },
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Download failed!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }
}
