
import 'package:equatable/equatable.dart';

abstract class ImagesEvent extends Equatable{

  const ImagesEvent();
  @override
  List<Object> get props {
    return [];
  }

}
class ImagesFetchEvent extends ImagesEvent {

}
class ImagesSearchEvent extends ImagesEvent {
  final String query;

  ImagesSearchEvent(this.query);

  @override
  List<Object> get props {
    return [query];
  }
}
//class ImagesPostEvent extends ImagesEvent {}

