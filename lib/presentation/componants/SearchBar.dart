// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/core/utils/request_state.dart';
import 'package:wallpaper_app/presentation/controllers/images_bloc.dart';
import 'package:wallpaper_app/presentation/controllers/images_event.dart';
import 'package:wallpaper_app/presentation/screens/search.dart';

class SearchBar extends StatelessWidget {
  final String? query;

  SearchBar({super.key,  this.query});

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: const Color.fromARGB(66, 192, 192, 192),
            border: Border.all(color: const Color.fromARGB(33, 13, 5, 5)),
            borderRadius: BorderRadius.circular(25)),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _searchController,
                onSubmitted: (query) => _handleSearch(context, query),

                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  hintText: "Search Wallpapers",
                  errorBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  border: InputBorder.none,


                ),
              ),
            ),
            InkWell(
             //  onTap: () {
    onTap: () => _handleSearch(context, _searchController.text),
  //  },
    //              final query = _searchController.text;
    //              if (query.isNotEmpty) {
    //                // إرسال حدث search إلى bloc
    //                context.read<ImagesBloc>().add(ImagesSearchEvent(query));
    //                // Navigator.push(
    //                //   context,
    //                //   MaterialPageRoute(builder: (context) => SearchScreen()),
    //                // );
    //
    //                context.read<ImagesBloc>().stream.firstWhere(
    //                      (state) => state.getImagesForSearchState == RequestState.loaded,
    //                );
    // //then((value) {
    //                  Navigator.push(
    //                    context,
    //                    MaterialPageRoute(
    //                      builder: (context) => const SearchScreen(),
    //                    ),
    //              //    );
    //              //  }
    //                );
    //
    //
    //
    //
    //              }



                 // print("searching");
                 // Navigator.push(
                 //     context,
                 //     MaterialPageRoute(
                 //         builder: (context) =>
                 //             SearchScreen(query: _searchController.text)));
               // },
                child: const Icon(Icons.search))
          ],
        ));
  }
  void _handleSearch(BuildContext context, String query) {
    if (query.isNotEmpty) {
      context.read<ImagesBloc>().add(ImagesSearchEvent(query));
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchScreen(searchQuery: query),
        ),
      );
    }
  }
}