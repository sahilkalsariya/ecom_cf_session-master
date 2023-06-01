import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper {
  AdHelper._();

  static final AdHelper adHelper = AdHelper._();

  BannerAd? bannerAd;

  loadBannerAd() async {
    bannerAd!.load();

    // bannerAd = BannerAd(
    //   size: AdSize.banner,
    //   adUnitId: "ca-app-pub-3940256099942544/6300978111",
    //   listener: BannerAdListener(
    //     onAdLoaded: (val) {
    //       if (val != null) {
    //         print("banner ad loaded....");
    //       }
    //     },
    //     onAdClosed: (val) {
    //       loadBannerAd();
    //     },
    //   ),
    //   request: AdRequest(),
    // )..load();
  }
}
