import 'dart:io';

import 'package:firebase_admob/firebase_admob.dart';

class AdvertService {
  static final AdvertService _instance = AdvertService._internal();
  factory AdvertService () => _instance; 

  MobileAdTargetingInfo _targetingInfo;
  final String _bannerAd = Platform.isAndroid 
  ? 'ca-app-pub-1113572237398382/9153535360' 
  : 'ca-app-pub-1113572237398382/9804272054';

  AdvertService._internal() {
    _targetingInfo = MobileAdTargetingInfo();
  }
  

  showBanner (){
    BannerAd banner = BannerAd (
      adUnitId: _bannerAd,
      size: AdSize.smartBanner,
      targetingInfo: _targetingInfo,
    );

    banner
      ..load()
      ..show();   // Reklamın yerini değiştirme -> ex:  anchorOffset: 50

    banner.dispose();

  }

  showInterstitial(){
    InterstitialAd interstitialAd = InterstitialAd(
      adUnitId: InterstitialAd.testAdUnitId,
        targetingInfo: _targetingInfo,
    );

    interstitialAd
      ..load()
      ..show();
  
      interstitialAd.dispose();
  }

}