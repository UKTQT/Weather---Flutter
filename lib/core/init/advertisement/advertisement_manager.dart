import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdvertisementManager {
  static final AdvertisementManager _instance = AdvertisementManager._init();
  static AdvertisementManager get instance => _instance;

  AdvertisementManager._init() {
    loadStaticBannerAd();
    loadInlineBannerAd();
  }

  late BannerAd staticAd;
  bool staticAdLoaded = false;
  late BannerAd inlineAd;
  bool inlineAdLoaded = false;
  static const AdRequest request = AdRequest();

  void loadStaticBannerAd() {
    staticAd = BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.banner,
      request: request,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          staticAdLoaded = true;
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print('Reklam yüklenemedi');
        },
      ),
    );

    staticAd.load();
  }

  void loadInlineBannerAd() {
    inlineAd = BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.banner,
      request: request,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          inlineAdLoaded = true;
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print('Reklam yüklenemedi');
        },
      ),
    );

    inlineAd.load();
  }
}
