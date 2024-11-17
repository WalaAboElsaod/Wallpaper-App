import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/core/services/services_locator.dart';
import 'package:wallpaper_app/data/darsource/base_remote_data_source.dart';
import 'package:wallpaper_app/presentation/componants/CatBlock.dart';
import 'package:wallpaper_app/presentation/componants/ImagesForHome.dart';
import 'package:wallpaper_app/presentation/componants/SearchBar.dart';
import 'package:wallpaper_app/presentation/controllers/images_bloc.dart';
import 'package:wallpaper_app/presentation/controllers/images_event.dart';

import '../componants/CustomAppBar.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatelessWidget {
 // final String query;

  const HomeScreen({Key? key,
   // required this.query
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: CustomAppBar(),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: SearchBar(),
            ),
            SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemBuilder: ((context, index) => const CatBlock()),
                  itemCount: 20,
                  scrollDirection: Axis.horizontal,
                )),
            SizedBox(
              height: 20,
            ),
            ImagesForHome(),
          ],
        ),
      ),

    );
  }
}
