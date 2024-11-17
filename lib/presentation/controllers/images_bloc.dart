import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wallpaper_app/core/abstract/base_usecase.dart';
import 'package:wallpaper_app/core/utils/request_state.dart';
import 'package:wallpaper_app/domain/usecases/get_images_bysraerch_useuase.dart';
import 'package:wallpaper_app/domain/usecases/get_images_useCase.dart';
import 'package:wallpaper_app/presentation/componants/ImgesForSearch.dart';
import 'package:wallpaper_app/presentation/controllers/images_event.dart';
import 'package:wallpaper_app/presentation/controllers/images_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagesBloc extends Bloc<ImagesEvent, ImagesState> {
  final GetImagesUseCase getImagesUseCase;
  final GetImagesForSearchUseCase getImagesForSearchUseCase;

  ImagesBloc(this.getImagesUseCase,this.getImagesForSearchUseCase) : super(ImagesState()) {
    on<ImagesFetchEvent>(_getImagesForHome);
    on<ImagesSearchEvent>(_getImagesForSearch);
  }


  Future<FutureOr<void>> _getImagesForHome(ImagesFetchEvent event,
      Emitter <ImagesState> emit) async {
    final result = await getImagesUseCase(const NoParameters());
 //   print(result);

    result.fold(
            (l) {
          emit(state.copyWith(getImagesForHomePageState: RequestState.error,
              getImagesForHomePageMessage: l.message));
          print(l);
        },
            (r) {
              print("home images: ${result.fold((l) => l.message, (r) => r.length)}");

              //      print(r);

          emit(state.copyWith(
              getImagesForHomePage: r,
              getImagesForHomePageState: RequestState.loaded));

              print("Fetching images for loaded images: ${state.getImagesForSearchState}");


            }


    );
  }





  FutureOr<void> _getImagesForSearch(ImagesSearchEvent event, Emitter<ImagesState> emit) async{
    //emit(state.copyWith(getImagesForSearchState: RequestState.loading));
    final result = await getImagesForSearchUseCase(ImagesQyeryForSearchModel( ImagesQuery: event.query) );
    print(result);

    result.fold(
            (l) {
          emit(state.copyWith(getImagesForSearchState: RequestState.error,
              getImagesForSearchPageMessage: l.message));
          print(l);
        },
            (r) {
          print(r);

          print("Fetched images: ${result.fold((l) => l.message, (r) => r.length)}");
          print("Fetching images for query: ${event.query}");
          print("Fetching images for query: ${state}");
          print("Fetching images for query: ${state.getImagesForSearchState}");


          emit(state.copyWith(
              getImagesForSearch: r,getImagesForSearchState: RequestState.loaded));
          print("Fetching images for loaded: ${state.getImagesForSearchState}");

            }




    );



  }
}