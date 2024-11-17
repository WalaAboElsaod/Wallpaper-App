import 'package:wallpaper_app/domain/entities/images.dart';

class ImagesModel extends Images {
  ImagesModel({  required super.Id, required super.ImageName, required super.SrcPoratrait});
  factory ImagesModel.FromJson(Map<String, dynamic> json) =>
      ImagesModel(Id: json['id'],
        ImageName: json["photographer"],
          SrcPoratrait: json['src']['portrait'],

      );
}
