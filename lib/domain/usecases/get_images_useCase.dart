import 'package:dartz/dartz.dart';
import 'package:wallpaper_app/core/abstract/base_usecase.dart';
import 'package:wallpaper_app/core/error/failure.dart';
import 'package:wallpaper_app/data/models/images_model.dart';
import 'package:wallpaper_app/domain/entities/images.dart';
import 'package:wallpaper_app/domain/repository/base_repository.dart';

class GetImagesUseCase extends BaseUseCase<List<Images>,NoParameters>{
  BaseRepositpryImages baseRepositpryImages;


  GetImagesUseCase(this.baseRepositpryImages);

  @override
  Future<Either<Failure, List<Images>>> call(NoParameters parameters)async {
    return await baseRepositpryImages.GetImagesList();
  }





  }

