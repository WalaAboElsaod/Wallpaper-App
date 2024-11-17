

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/core/utils/request_state.dart';
import 'package:wallpaper_app/data/darsource/base_remote_data_source.dart';
import 'package:wallpaper_app/presentation/componants/CatBlock.dart';
import 'package:wallpaper_app/presentation/componants/SearchBar.dart';
import 'package:wallpaper_app/presentation/controllers/images_bloc.dart';
import 'package:wallpaper_app/presentation/controllers/images_state.dart';

import '../componants/CustomAppBar.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GetImagesForSearch extends StatelessWidget {
  const GetImagesForSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImagesBloc,ImagesState>(



        builder: (context, state)
    {
      switch(state.getImagesForSearchState){

        case RequestState.loading :
          return  SizedBox(
              height: 400,
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              ));
        case RequestState.loaded:
          print("Loaded state triggered with data: ${state.getImagesForSearch}");
          return   Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 700,

              child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 400,
                      crossAxisCount: 2,
                      crossAxisSpacing: 13,
                      mainAxisSpacing: 10),
                  itemCount: state.getImagesForSearch.length,
                  itemBuilder: ((context, index) {
       final item=state.getImagesForSearch[index];
                    return  Container(
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
                       //   "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    );
                  }

                  )
              )
          );

        case RequestState.error:
          return Center(
            child: Text(state.getImagesForSearchPageMessage),
          );

      }

      // if (state is SearchLoading) {
      //   return Center(child: CircularProgressIndicator());
      // }



      }
      // else if (state is SearchError) {
      //   return Center(child: Text(state.message));
      // }
  //

   // }
    );




  }
}
