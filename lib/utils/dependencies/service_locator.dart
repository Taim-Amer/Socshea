import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initServiceLocator(){

}
//
// void setupServiceLocator() {
//   getIt.registerSingleton<ApiService>(ApiService(Dio()));
//
//   getIt.registerSingleton<CacheServices>(CacheServices());
//
//   getIt.registerSingleton<LoginRepoImpl>(
//       LoginRepoImpl(apiService: getIt.get<ApiService>()));
//
//   getIt.registerSingleton<RegisterRepoImpl>(
//       RegisterRepoImpl(apiService: getIt.get<ApiService>()));
//
//   getIt.registerSingleton<HomeRepoImpl>(
//       HomeRepoImpl(apiService: getIt.get<ApiService>()));
//
//   getIt.registerSingleton<RoadMapRepoImpl>(
//       RoadMapRepoImpl(apiService: getIt.get<ApiService>()));
//   getIt.registerSingleton<CompetitionRepoImpl>(
//       CompetitionRepoImpl(apiService: getIt.get<ApiService>()));
//
//   getIt.registerSingleton<CompanyRepoImpl>(
//       CompanyRepoImpl(apiService: getIt.get<ApiService>()));
//
//
//   getIt.registerSingleton<SearchRepoImpl>(
//       SearchRepoImpl(apiService: getIt.get<ApiService>()));