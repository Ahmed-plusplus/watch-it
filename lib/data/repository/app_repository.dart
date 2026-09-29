import 'package:watchit/data/model/video_model.dart';

class AppRepository {

  final List<VideoModel> _videos = [
    VideoModel(id: 'PDgi0UJBy0E', title: 'حفظ سورة الفاتحة'),
    VideoModel(id: 'hPBWgbP2GNg', title: 'حفظ سورة الإخلاص'),
    VideoModel(id: 'svyUGy8OR2I', title: 'حفظ سورة الفلق'),
    VideoModel(id: 'Kymt0nz7m5o', title: 'حفظ سورة الناس'),
    VideoModel(id: 'g5tWOVZbJcA', title: 'حفظ سورة الكافرون'),
    VideoModel(id: 'k4nmjCFedBw', title: 'حفظ سورة النصر'),
    VideoModel(id: 'AIYD2q7p1SM', title: 'حفظ سورة المسد'),
    VideoModel(id: '0w71_r-Z-gg', title: 'حفظ سورة قريش'),
    VideoModel(id: 'DPo4BwCOW8g', title: 'حفظ سورة الماعون'),
    VideoModel(id: 's3-uQVnvjA0', title: 'حفظ سورة الكوثر'),
    VideoModel(id: 'gpLZWfc4YO0', title: 'حفظ سورة العصر'),
    VideoModel(id: 'waPhdcJEWQ0', title: 'حفظ سورة الهمزة'),
    VideoModel(id: 'pUAfmL9LDVE', title: 'حفظ سورة الفيل'),
    VideoModel(id: 'qCfDjmm7RJE', title: 'حفظ سورة القارعة'),
    VideoModel(id: '30zXQb_01d8', title: 'حفظ سورة التكاثر'),
    VideoModel(id: '9byHLbiNQ-A', title: 'حفظ سورة الزلزلة'),
    VideoModel(id: 'KzJOlvUnWAU', title: 'حفظ سورة العاديات'),
    VideoModel(id: 'i5CtZYj1-wU', title: 'حفظ سورة القدر'),
    VideoModel(id: 'ECKLNn_yUcA', title: 'حفظ سورة البينة'),
    VideoModel(id: 'JE61l5hqTLs', title: 'حفظ سورة التين'),
    VideoModel(id: 'hMvaybM39gE', title: 'حفظ سورة العلق'),
    VideoModel(id: 'oQxRZf7-6Nk', title: 'حفظ سورة الضحى'),
    VideoModel(id: 'D9GE8QOVkrg', title: 'حفظ سورة الشرح'),
    VideoModel(id: 'nKbJKOtoNqY', title: 'حفظ سورة الشمس'),
    VideoModel(id: 'nN-4Ta9iZyo', title: 'حفظ سورة الليل'),
  ];

  List<VideoModel> getVideosByQuery(String query){
    return _videos.where((video) => video.title.contains(query.trim())).toList();
  }
}