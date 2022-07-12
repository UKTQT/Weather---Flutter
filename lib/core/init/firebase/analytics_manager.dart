import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsManager {
  static final AnalyticsManager _instance = AnalyticsManager._init();
  static AnalyticsManager get instance => _instance;

  FirebaseAnalytics? _analytics;

  AnalyticsManager._init() {
    _analytics = FirebaseAnalytics.instance;
  }

  void setUserId({required String userId}) async {
    await instance._analytics!.setUserId(id: userId);
  }

  void screenLogEvent() async {
    await FirebaseAnalytics.instance.logBeginCheckout(
        value: 10.0,
        currency: 'USD',
        items: [
          AnalyticsEventItem(
            itemName: 'Socks',
            itemId: 'xjw73ndnw',
          ),
        ],
        coupon: '10PERCENTOFF');
  }
}
