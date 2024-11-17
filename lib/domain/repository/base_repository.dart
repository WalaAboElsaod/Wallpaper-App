import 'package:flutter/material.dart';
import 'package:wallpaper_app/core/error/failure.dart';
import 'package:wallpaper_app/domain/entities/images.dart';
import 'package:dartz/dartz.dart';
import 'package:wallpaper_app/domain/usecases/get_images_bysraerch_useuase.dart';
abstract class BaseRepositpryImages{
Future<Either<Failure,List<Images>>> GetImagesList();
Future<Either<Failure,List<Images>>> GetImagesListBySearch(ImagesQyeryForSearchModel prameter);
}