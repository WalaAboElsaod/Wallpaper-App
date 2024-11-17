import 'package:dartz/dartz.dart';
import 'package:wallpaper_app/core/error/exception.dart';
import 'package:wallpaper_app/core/error/failure.dart';
import 'package:wallpaper_app/core/network/error_message_model.dart';
import 'package:wallpaper_app/core/utils/app_constance.dart';
import 'package:wallpaper_app/data/models/images_model.dart';
import 'package:dio/dio.dart';
import 'package:wallpaper_app/domain/usecases/get_images_bysraerch_useuase.dart';

abstract class BaseImagesRemoteDataSource {
  Future<List<ImagesModel>> GetImagesList();
  Future<List<ImagesModel>> GetImagesListBySearch(ImagesQyeryForSearchModel prameter);
}

class ImagesRemoteDataSource extends BaseImagesRemoteDataSource {
  @override
  Future<List<ImagesModel>> GetImagesList() async {
    final Dio _dio = Dio();

    _dio.options.headers['Authorization'] = ApiConstance.apiKey;
    final response = await _dio.get(ApiConstance.getImages
        //,
     //   queryParameters: {
    //  'per_page': 10,
   // }
    );
    if (response.statusCode == 200) {
       //     print(response.data);

      return List<ImagesModel>.from((
          response.data['photos'] as List).map((json) => ImagesModel.FromJson(json)));
      print(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<ImagesModel>> GetImagesListBySearch ( ImagesQyeryForSearchModel prameter) async{

    final Dio _dio = Dio();
    _dio.options.headers['Authorization']=ApiConstance.apiKey;
    final response= await _dio.get(ApiConstance.getImagesBySearch,  queryParameters: {
      'query': prameter,
      'per_page': 30,
      'page': 1,
    },) ;
    if(response.statusCode==200){
    return List<ImagesModel>.from(response.data['photos'].map((json)=>ImagesModel.FromJson(json)));
    }
    else {
       throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));

    }
    }
  }




