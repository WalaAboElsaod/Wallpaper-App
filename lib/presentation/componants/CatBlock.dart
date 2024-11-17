import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CatBlock extends StatelessWidget {
  const CatBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 7),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              height: 50,
              width: 100,
              fit: BoxFit.fill,
              imageUrl:
                  "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.black26, borderRadius: BorderRadius.circular(20)),
          ),
          Positioned(
              left: 30,
              top: 15,
              child: Text(
                "car",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ))
        ],
      ),

//       child:CachedNetworkImage(
//   imageUrl: 'https://example.com/image.jpg',
//   placeholder: (context, url) => CircularProgressIndicator(),
//   errorWidget: (context, url, error) => Icon(Icons.error),
// )
// Image.network(
//   "https://www.pexels.com/photo/gray-mercedez-benz-amg-112460/",
//   loadingBuilder: (context, child, loadingProgress) {
//     if (loadingProgress == null) return child;
//     return CircularProgressIndicator();
//   },
//   errorBuilder: (context, error, stackTrace) {
//     return Text('Failed to load image');
//   },
// )

      // Image.network("https://www.pexels.com/photo/red-alfa-romeo-c4-on-road-near-trees-210019/"),
    );
  }
}
