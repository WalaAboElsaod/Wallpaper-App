import 'package:get_it/get_it.dart';
import 'package:wallpaper_app/core/abstract/base_usecase.dart';
import 'package:wallpaper_app/data/darsource/base_remote_data_source.dart';
import 'package:wallpaper_app/data/repository/image_repository.dart';
import 'package:wallpaper_app/domain/repository/base_repository.dart';
import 'package:wallpaper_app/domain/usecases/get_images_bysraerch_useuase.dart';
import 'package:wallpaper_app/domain/usecases/get_images_useCase.dart';
import 'package:wallpaper_app/presentation/controllers/images_bloc.dart';

final sl =GetIt.instance;
class ServicesLocator{
  void init()
///DATASOURCE

  {
    sl.registerFactory(() => ImagesBloc(sl(),sl()));

    sl.registerLazySingleton(()=>GetImagesForSearchUseCase(sl()));
    sl.registerLazySingleton(()=>GetImagesUseCase(sl()));
    sl.registerLazySingleton<BaseRepositpryImages>(()=>ImageRepository(sl()));
    sl.registerLazySingleton<BaseImagesRemoteDataSource>(()=>ImagesRemoteDataSource());

}
}
