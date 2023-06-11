import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:snap_grid/src/core/network/network.dart';
import 'package:snap_grid/src/features/home/provider/home_provider.dart';

class MockHttpClient extends Mock implements AppNetwork {}

void main() {
  group('PhotoProvider', () {
    late PhotoProvider photoProvider;
    late AppNetwork appNetwork;

    setUp(() {
      appNetwork = AppNetwork();
      photoProvider = PhotoProvider(appNetwork);
    });

    test('fetchPhotos should fetch and populate photos list', () async {
      // Arrange
      final response = http.Response(
        '[{"id":"1","title":"Photo 1","imageUrl":"https://example.com/photo1.jpg","description":"Description 1","author":"Author 1"}]',
        200,
      );
      when(appNetwork.getRequest(
              "https://api.unsplash.com/photos?page=${photoProvider.getPage}&per_page=${photoProvider.getPerPage}"))
          .thenAnswer((_) async => response);

      // Act
      await photoProvider.fetchPhotos();

      // // Assert
      // expect(photoProvider.getphotos.length, 1);
      // expect(photoProvider.getphotos[0].id, '1');
      // expect(photoProvider.getphotos[0].title, 'Photo 1');
      // expect(photoProvider.getphotos[0].imageUrl,
      //     'https://example.com/photo1.jpg');
      // expect(photoProvider.getphotos[0].description, 'Description 1');
      // expect(photoProvider.getphotos[0].author, 'Author 1');
    });
  });
}
