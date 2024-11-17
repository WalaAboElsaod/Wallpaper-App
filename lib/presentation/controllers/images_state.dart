import 'package:equatable/equatable.dart';
import 'package:wallpaper_app/core/utils/request_state.dart';
import 'package:wallpaper_app/domain/entities/images.dart';

class ImagesState extends Equatable {

  final List<Images> getImagesForHomePage;
  final RequestState getImagesForHomePageState;
  final String getImagesForHomePageMessage;
  final List<Images> getImagesForSearch;
  final RequestState getImagesForSearchState;
  final String getImagesForSearchPageMessage;

  ImagesState(
     {
      this.getImagesForHomePage = const[],
      this.getImagesForHomePageState=RequestState.loading,
      this.getImagesForHomePageMessage='',
       this.getImagesForSearch=const [],
       this.getImagesForSearchState=RequestState.loading,
       this.getImagesForSearchPageMessage='',
     }

      );

  ImagesState copyWith({

     List<Images>? getImagesForHomePage,
     RequestState? getImagesForHomePageState,
     String? getImagesForHomePageMessage,
    final List<Images>? getImagesForSearch,
    final RequestState? getImagesForSearchState,
    final String? getImagesForSearchPageMessage,
}){
    return ImagesState(
      getImagesForHomePage: getImagesForHomePage?? this.getImagesForHomePage,
      getImagesForHomePageState: getImagesForHomePageState?? this.getImagesForHomePageState,
      getImagesForHomePageMessage: getImagesForHomePageMessage?? this.getImagesForHomePageMessage,

      getImagesForSearch: getImagesForSearch?? this.getImagesForSearch,
      getImagesForSearchState: getImagesForSearchState?? this.getImagesForSearchState,
      getImagesForSearchPageMessage: getImagesForSearchPageMessage?? this.getImagesForSearchPageMessage,




    );
  }




  @override
  List<Object> get props =>
      [
        getImagesForHomePage,
        getImagesForHomePageState,
        getImagesForHomePageMessage,
        getImagesForSearch,
        getImagesForSearchState,
        getImagesForSearchPageMessage,

      ];
}