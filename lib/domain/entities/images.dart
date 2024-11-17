import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:wallpaper_app/domain/entities/src.dart';

class Images extends Equatable {
  final int Id;
  final String SrcPoratrait;
  final String ImageName;

  const Images(  { required this.Id,
    required this.ImageName, required this.SrcPoratrait
  });

  @override
  List<Object> get props => [SrcPoratrait, ImageName,Id];
}

