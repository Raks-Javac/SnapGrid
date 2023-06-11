import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:snap_grid/src/core/storage/local_storage.dart';

var testData = [
  {
    "id": "hgf0fJGJPQs",
    "slug": "hgf0fJGJPQs",
    "created_at": "2023-04-28T15:30:26Z",
    "updated_at": "2023-06-09T02:35:53Z",
    "promoted_at": null,
    "width": 8640,
    "height": 5760,
    "color": "#735959",
    "blur_hash": "L8Bfnh.90eRP~Wt8IUM_NGNHoft6",
    "description":
        "Thamudic Inscription, Nature Reserve – NEOM, Saudi Arabia | In NEOM, thousands of inscriptions have been found etched onto stone, giving us a unique window into the linguistic diversity and richness of ancient Arabia.",
    "alt_description": "a person pointing at a rock with writing on it",
    "urls": {
      "raw":
          "https://images.unsplash.com/photo-1682695798256-28a674122872?ixid=M3w0NTk3NDZ8MXwxfGFsbHwxfHx8fHx8Mnx8MTY4NjM2MDE0OXw&ixlib=rb-4.0.3",
      "full":
          "https://images.unsplash.com/photo-1682695798256-28a674122872?crop=entropy&cs=srgb&fm=jpg&ixid=M3w0NTk3NDZ8MXwxfGFsbHwxfHx8fHx8Mnx8MTY4NjM2MDE0OXw&ixlib=rb-4.0.3&q=85",
      "regular":
          "https://images.unsplash.com/photo-1682695798256-28a674122872?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTk3NDZ8MXwxfGFsbHwxfHx8fHx8Mnx8MTY4NjM2MDE0OXw&ixlib=rb-4.0.3&q=80&w=1080",
      "small":
          "https://images.unsplash.com/photo-1682695798256-28a674122872?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTk3NDZ8MXwxfGFsbHwxfHx8fHx8Mnx8MTY4NjM2MDE0OXw&ixlib=rb-4.0.3&q=80&w=400",
      "thumb":
          "https://images.unsplash.com/photo-1682695798256-28a674122872?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTk3NDZ8MXwxfGFsbHwxfHx8fHx8Mnx8MTY4NjM2MDE0OXw&ixlib=rb-4.0.3&q=80&w=200",
      "small_s3":
          "https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1682695798256-28a674122872"
    },
    "links": {
      "self": "https://api.unsplash.com/photos/hgf0fJGJPQs",
      "html": "https://unsplash.com/photos/hgf0fJGJPQs",
      "download":
          "https://unsplash.com/photos/hgf0fJGJPQs/download?ixid=M3w0NTk3NDZ8MXwxfGFsbHwxfHx8fHx8Mnx8MTY4NjM2MDE0OXw",
      "download_location":
          "https://api.unsplash.com/photos/hgf0fJGJPQs/download?ixid=M3w0NTk3NDZ8MXwxfGFsbHwxfHx8fHx8Mnx8MTY4NjM2MDE0OXw"
    },
    "likes": 25,
    "liked_by_user": false,
    "current_user_collections": [],
    "sponsorship": {
      "impression_urls": [
        "https://secure.insightexpressai.com/adServer/adServerESI.aspx?script=false&bannerID=11515601&rnd=[timestamp]&redir=https://secure.insightexpressai.com/adserver/1pixel.gif",
        "https://secure.insightexpressai.com/adServer/adServerESI.aspx?script=false&bannerID=11515804&rnd=[timestamp]&redir=https://secure.insightexpressai.com/adserver/1pixel.gif"
      ],
      "tagline": "Made to Change",
      "tagline_url":
          "https://www.neom.com/en-us?utm_source=unsplash&utm_medium=referral",
      "sponsor": {
        "id": "mYizSrdJkkU",
        "updated_at": "2023-06-10T00:51:39Z",
        "username": "neom",
        "name": "NEOM",
        "first_name": "NEOM",
        "last_name": null,
        "twitter_username": "neom",
        "portfolio_url": "http://www.neom.com",
        "bio":
            "Located in the northwest of Saudi Arabia, NEOM’s diverse climate offers both sun-soaked beaches and snow-capped mountains. NEOM’s unique location will provide residents with enhanced livability while protecting 95% of the natural landscape.",
        "location": "NEOM, Saudi Arabia",
        "links": {
          "self": "https://api.unsplash.com/users/neom",
          "html": "https://unsplash.com/es/@neom",
          "photos": "https://api.unsplash.com/users/neom/photos",
          "likes": "https://api.unsplash.com/users/neom/likes",
          "portfolio": "https://api.unsplash.com/users/neom/portfolio",
          "following": "https://api.unsplash.com/users/neom/following",
          "followers": "https://api.unsplash.com/users/neom/followers"
        },
        "profile_image": {
          "small":
              "https://images.unsplash.com/profile-1679489218992-ebe823c797dfimage?ixlib=rb-4.0.3&crop=faces&fit=crop&w=32&h=32",
          "medium":
              "https://images.unsplash.com/profile-1679489218992-ebe823c797dfimage?ixlib=rb-4.0.3&crop=faces&fit=crop&w=64&h=64",
          "large":
              "https://images.unsplash.com/profile-1679489218992-ebe823c797dfimage?ixlib=rb-4.0.3&crop=faces&fit=crop&w=128&h=128"
        },
        "instagram_username": "discoverneom",
        "total_collections": 7,
        "total_likes": 0,
        "total_photos": 202,
        "accepted_tos": true,
        "for_hire": false,
        "social": {
          "instagram_username": "discoverneom",
          "portfolio_url": "http://www.neom.com",
          "twitter_username": "neom",
          "paypal_email": null
        }
      }
    },
    "topic_submissions": {},
    "user": {
      "id": "mYizSrdJkkU",
      "updated_at": "2023-06-10T00:51:39Z",
      "username": "neom",
      "name": "NEOM",
      "first_name": "NEOM",
      "last_name": null,
      "twitter_username": "neom",
      "portfolio_url": "http://www.neom.com",
      "bio":
          "Located in the northwest of Saudi Arabia, NEOM’s diverse climate offers both sun-soaked beaches and snow-capped mountains. NEOM’s unique location will provide residents with enhanced livability while protecting 95% of the natural landscape.",
      "location": "NEOM, Saudi Arabia",
      "links": {
        "self": "https://api.unsplash.com/users/neom",
        "html": "https://unsplash.com/es/@neom",
        "photos": "https://api.unsplash.com/users/neom/photos",
        "likes": "https://api.unsplash.com/users/neom/likes",
        "portfolio": "https://api.unsplash.com/users/neom/portfolio",
        "following": "https://api.unsplash.com/users/neom/following",
        "followers": "https://api.unsplash.com/users/neom/followers"
      },
      "profile_image": {
        "small":
            "https://images.unsplash.com/profile-1679489218992-ebe823c797dfimage?ixlib=rb-4.0.3&crop=faces&fit=crop&w=32&h=32",
        "medium":
            "https://images.unsplash.com/profile-1679489218992-ebe823c797dfimage?ixlib=rb-4.0.3&crop=faces&fit=crop&w=64&h=64",
        "large":
            "https://images.unsplash.com/profile-1679489218992-ebe823c797dfimage?ixlib=rb-4.0.3&crop=faces&fit=crop&w=128&h=128"
      },
      "instagram_username": "discoverneom",
      "total_collections": 7,
      "total_likes": 0,
      "total_photos": 202,
      "accepted_tos": true,
      "for_hire": false,
      "social": {
        "instagram_username": "discoverneom",
        "portfolio_url": "http://www.neom.com",
        "twitter_username": "neom",
        "paypal_email": null
      }
    }
  }
];

//mocking an abstraction of the local storage
class MockSharedPreferences extends Mock implements AsbstractSgLocalStorage {
  @override
  Future getPhotosFromStore() async {
    return testData;
  }

  @override
  Future<void> storePhotosFromStore(value) async {
    return;
  }
}

void main() {
  group('SgLocalStorage', () {
    late SgLocalStorage sgLocalStorage;

    late MockSharedPreferences mockSharedPreferences;

    setUp(() {
      mockSharedPreferences = MockSharedPreferences();
      sgLocalStorage = SgLocalStorage();
    });

    group('getPhotosFromStore', () {
      test('get photos from the local storage', () async {
        final mockSerializedStore = json.encode(testData);
        when(await mockSharedPreferences.getPhotosFromStore())
            .thenReturn(mockSerializedStore);

        final result = await sgLocalStorage.getPhotosFromStore();

        expect(result, mockSerializedStore);
      });
    });

    group('store Photos to local storage', () {
      test('should store serialized store', () async {
        final mockValue = testData;
        await sgLocalStorage.storePhotosFromStore(mockValue);
        verify(mockSharedPreferences.storePhotosFromStore(mockValue));
      });
    });
  });
}
