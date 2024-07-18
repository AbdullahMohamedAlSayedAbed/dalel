import 'package:dalel/core/cache/cache_helper.dart';

void isViewVisited(String viewVisited) {
  CacheHelper.saveData(key: viewVisited, value: true);
}
