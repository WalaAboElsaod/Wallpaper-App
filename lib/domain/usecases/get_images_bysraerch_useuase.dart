import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wallpaper_app/core/abstract/base_usecase.dart';
import 'package:wallpaper_app/core/error/failure.dart';
import 'package:wallpaper_app/data/models/images_model.dart';
import 'package:wallpaper_app/domain/entities/images.dart';
import 'package:wallpaper_app/domain/repository/base_repository.dart';

class GetImagesForSearchUseCase extends BaseUseCase<List<Images>,ImagesQyeryForSearchModel>{
  BaseRepositpryImages baseRepositpryImages;


  GetImagesForSearchUseCase(this.baseRepositpryImages);

  @override
  Future<Either<Failure, List<Images>>> call(ImagesQyeryForSearchModel parameters)async {
    return await baseRepositpryImages.GetImagesListBySearch(parameters);
  }

}

class ImagesQyeryForSearchModel  extends Equatable{
final String ImagesQuery;

const ImagesQyeryForSearchModel({

required this.ImagesQuery,

});

@override
List<Object?> get props => [ImagesQuery];
}
