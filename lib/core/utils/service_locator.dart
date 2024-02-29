import 'package:get_it/get_it.dart';
import 'package:nectar/features/home/data/repos/shop_repo_imp.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ShopRepoImp>(ShopRepoImp());
}
