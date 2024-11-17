import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/presentation/componants/CatBlock.dart';
import 'package:wallpaper_app/presentation/componants/ImgesForSearch.dart';
import 'package:wallpaper_app/presentation/componants/SearchBar.dart';
import 'package:wallpaper_app/presentation/controllers/images_bloc.dart';
import 'package:wallpaper_app/presentation/controllers/images_event.dart';
import 'package:wallpaper_app/presentation/controllers/images_state.dart';

import '../componants/CustomAppBar.dart';
import 'package:cached_network_image/cached_network_image.dart';

// class SearchScreen extends StatelessWidget {
//   final String searchQuery;
//   const SearchScreen({Key? key, required this.searchQuery}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     BlocProvider.of<ImagesBloc>(context).add(ImagesSearchEvent(searchQuery));
//  //   context.read<ImagesBloc>().add(ImagesSearchEvent(searchQuery));
//     return
//
//           //هنا هتحطي الاحتملات سواء لوادينج او غيره ونكلي من شات جي بي تي ولازم تدوني عملتي ايه بالظبط
//
//       Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           title: CustomAppBar(),
//           backgroundColor: Colors.white,
//           centerTitle: true,
//           elevation: 0.0,
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//
//               SizedBox(
//                 height: 20,
//               ),
//               GetImagesForSearch(),
//             ],
//           ),
//         ),
//       );
//
//     }
//   }
//
class SearchScreen extends StatefulWidget {
  final String searchQuery;

  const SearchScreen({Key? key, required this.searchQuery}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    // تأكد من تحديث الـ search عند فتح الصفحة
    context.read<ImagesBloc>().add(ImagesSearchEvent(widget.searchQuery));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search: ${widget.searchQuery}',style: TextStyle(color: Colors.black),),backgroundColor: Colors.grey,elevation: 0.0,
      ),
      body:SizedBox(height: 20,
     child: const GetImagesForSearch()),
    );
  }
}