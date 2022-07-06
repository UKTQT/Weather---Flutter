import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdvertisementManager {
  static final AdvertisementManager _instance = AdvertisementManager._init();
  static AdvertisementManager get instance => _instance;

  AdvertisementManager._init() {
    loadStaticBannerAd();
  }

  late BannerAd staticAd;
  //bool staticAdLoaded = false;
  late BannerAd inlineAd;
  //bool inlineAdLoaded = false;
  static const AdRequest request = AdRequest();

  void loadStaticBannerAd() {
    staticAd = BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.banner,
      request: request,
      listener: BannerAdListener(
        onAdLoaded: (ad) {},
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print('InterstitialAd failed to load: $error.');
        },
      ),
    );

    staticAd.load();
  }
}
