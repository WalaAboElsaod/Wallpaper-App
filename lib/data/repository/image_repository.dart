import 'package:wallpaper_app/data/darsource/base_remote_data_source.dart';
import 'package:wallpaper_app/domain/entities/images.dart';
import 'package:wallpaper_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:wallpaper_app/domain/repository/base_repository.dart';
import 'package:wallpaper_app/domain/usecases/get_images_bysraerch_useuase.dart';

class ImageRepository extends BaseRepositpryImages {
  BaseImagesRemoteDataSource baseImagesRemoteDataSource;
  ImageRepository(this.baseImagesRemoteDataSource);
  @override
  Future<Either<Failure, List<Images>>> GetImagesList() async{
    var result = await baseImagesRemoteDataSource.GetImagesList();
    try {
      return Right(result);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override

  Future<Either<Failure, List<Images>>> GetImagesListBySearch(ImagesQyeryForSearchModel prameter) async {
    var result = await baseImagesRemoteDataSource.GetImagesListBySearch(
        prameter);
    try {
      return Right(result);
    }
    on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

}
