import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:getflutter/getflutter.dart';

class ImageGrid extends StatelessWidget {
  final List<String> images;
  ImageGrid({this.images});

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      shrinkWrap: true,
      primary: false,
      crossAxisCount: 4,
      itemCount: this.images.length,
      itemBuilder: (BuildContext context, int index) => Container(
          child: GFImageOverlay(
        image: NetworkImage(images[index]),
        borderRadius: BorderRadius.circular(10.0),
      )),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 1),
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
    );
  }
}
