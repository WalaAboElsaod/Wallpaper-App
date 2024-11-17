import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/core/utils/request_state.dart';
import 'package:wallpaper_app/data/darsource/base_remote_data_source.dart';
import 'package:wallpaper_app/presentation/componants/CatBlock.dart';
import 'package:wallpaper_app/presentation/componants/SearchBar.dart';
import 'package:wallpaper_app/presentation/controllers/images_bloc.dart';
import 'package:wallpaper_app/presentation/controllers/images_state.dart';
import 'package:wallpaper_app/presentation/screens/home.dart';

import '../componants/CustomAppBar.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImagesForHome extends StatelessWidget {
  const ImagesForHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImagesBloc, ImagesState>(
     //   buildWhen: (previous, current) =>
           // previous.getImagesForHomePageState !=
         //   current.getImagesForHomePageState
        builder: (BuildContext context, state) {
          print('BlocBuilder NowPlayingComponanet ');

          switch (state.getImagesForHomePageState) {
            case RequestState.loading:
              return
              SizedBox(
                  height: 400,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.deepOrange,
                    ),
                  ));
            case RequestState.loaded:
              return

                  // Container(
                  //  margin: EdgeInsets.symmetric(horizontal: 10),
                  //  height: 700,
                  //  child: RefreshIndicator(
                  //      onRefresh: () async {
                  //        Navigator.pushReplacement(
                  //            context,
                  //            MaterialPageRoute(
                  //                builder: (context) => HomeScreen()));
                  //      },
                  //      child:
                  GridView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 400,

                          crossAxisCount: 2,
                          crossAxisSpacing: 13,
                          mainAxisSpacing: 10),
                      itemCount:
                     state.getImagesForHomePage.length ,
                      itemBuilder: ((context, index) {
                        final   item=state.getImagesForHomePage[index];
                        return   GestureDetector(

                          // key: const Key('openMovieMinimalDetail'),
                          // onTap: () {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (BuildContext context) => MovieDetailScreen(id: item.id),
                          //     ),
                          //   );
                          // },

                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.amberAccent,
                                borderRadius: BorderRadius.circular(20)),
                            height: 800,
                            width: 50,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: CachedNetworkImage(
                                height: 50,
                                width: 100,
                                fit: BoxFit.cover,
                                imageUrl:item.SrcPoratrait,
                               // "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                        );
                      }



                      ));

            case RequestState.error:
              return Center(
                child: Text(state.getImagesForHomePageMessage),
              );
          }
        });
  }
}
