class AppConstant {
  static final AppConstant _instance = AppConstant._init();
  static AppConstant get instance => _instance;

  AppConstant._init();

  //Main Constants
  final PROJECT_TITLE = 'Weather App';
  final PROJECT_LOGO_PATH = 'assets/images/marvel-logo.png';
  final PROJECT_BASE_URL = 'https://api.collectapi.com/weather/';

  // Image Constants
  final NIGHT_CONS = 'assets/images/night.ico';
  final HUMIDITY_CONS = 'assets/images/humidity.png';
  final MIN_IMAGE_CONS = 'assets/images/down.png';
  final MAX_IMAGE_CONS = 'assets/images/up.png';

  // Settings Constants
  final SETTINGS_TITLE = 'Ayarlar';
  final SETTINGS_CITY_TITLE = 'Şehir Seçimi';
  final SETTINGS_LANG_TITLE = 'Dil Seçimi';
  final SETTINGS_DESC = 'Seçim yapıldığı an kaydedilir.';
  final TURKISH_CITIES = [
    "Adana",
    "Adiyaman",
    "Afyonkarahisar",
    "Agri",
    "Aksaray",
    "Amasya",
    "Ankara",
    "Antalya",
    "Ardahan",
    "Artvin",
    "Aydin",
    "Balikesir",
    "Bartin",
    "Batman",
    "Bayburt",
    "Bilecik",
    "Bingol",
    "Bitlis",
    "Bolu",
    "Burdur",
    "Bursa",
    "Canakkale",
    "Cankiri",
    "Corum",
    "Denizli",
    "Diyarbakir",
    "Duzce",
    "Edirne",
    "Elazig",
    "Erzincan",
    "Erzurum",
    "Eskisehir",
    "Gaziantep",
    "Giresun",
    "Gumushane",
    "Hakkari",
    "Hatay",
    "Igdir",
    "Isparta",
    "Istanbul",
    "Izmir",
    "Kahramanmaras",
    "Karabuk",
    "Karaman",
    "Kars",
    "Kastamonu",
    "Kayseri",
    "Kilis",
    "Kirikkale",
    "Kirklareli",
    "Kirsehir",
    "Kocaeli",
    "Konya",
    "Kutahya",
    "Malatya",
    "Manisa",
    "Mardin",
    "Mersin",
    "Mugla",
    "Mus",
    "Nevsehir",
    "Nigde",
    "Ordu",
    "Osmaniye",
    "Rize",
    "Sakarya",
    "Samsun",
    "Sanliurfa",
    "Siirt",
    "Sinop",
    "Sirnak",
    "Sivas",
    "Tekirdag",
    "Tokat",
    "Trabzon",
    "Tunceli",
    "Usak",
    "Van",
    "Yalova",
    "Yozgat",
    "Zonguldak"
  ];
}
