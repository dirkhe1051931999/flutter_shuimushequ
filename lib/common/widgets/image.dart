import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:provider/provider.dart';
import 'package:shuimushequ/common/provider/index.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/values/index.dart';

// 图片缓存
Widget imageCached({
  String url,
  double width = 48,
  double height = 48,
  EdgeInsetsGeometry margin,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: Radii.k6pxRadius,
    ),
    child: ClipRRect(
      borderRadius: Radii.k6pxRadius,
      child: new FadeInImage.assetNetwork(
        height: duSetHeight(height),
        width: duSetWidth(width),
        placeholder: 'assets/images/placeholder.jpeg',
        image: url,
        alignment: Alignment.center,
        fit: BoxFit.cover,
        imageErrorBuilder: (context, error, stackTrace) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
            ),
          ],
        ),
        fadeInDuration: Duration(seconds: 1),
      ),
    ),
  );
}

// 图片预览
class ImageViewPage extends StatefulWidget {
  ImageViewPage({Key key}) : super(key: key);

  @override
  _ImageViewPageState createState() => _ImageViewPageState();
}

class _ImageViewPageState extends State<ImageViewPage> {
  int initialIndex = 0;
  AppState _appState;
  int currentIndex = 0;

  void onPageChanged(int index) {
    setState(() {
      _appState.setImageViewCurrentIndex(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    _appState = Provider.of<AppState>(context);
    List galleryItems = _appState.imageViewAllData;
    currentIndex = _appState.imageViewCurrentIndex;
    return Stack(
      children: <Widget>[
        PhotoViewGallery.builder(
          scrollPhysics: const BouncingScrollPhysics(),
          builder: (BuildContext context, int index) {
            dynamic item = galleryItems[currentIndex];
            return PhotoViewGalleryPageOptions(
              imageProvider: NetworkImage(
                  'https://ks3-cn-beijing.ksyun.com/attachment/${item["hash"]}@base@tag=imgScale&w=320&h=320&m=2'),
              initialScale: PhotoViewComputedScale.contained,
              minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
              maxScale: PhotoViewComputedScale.covered * 4.1,
              heroAttributes: PhotoViewHeroAttributes(tag: item['hash']),
              onTapDown: (context, details, controllerValue) => {
                Navigator.pop(context),
              },
            );
          },
          itemCount: galleryItems.length,
          loadingBuilder: (context, event) => Center(
            child: Container(
              width: duSetWidth(20),
              height: duSetHeight(20),
              child: CircularProgressIndicator(
                value: event == null
                    ? 0
                    : event.cumulativeBytesLoaded / event.expectedTotalBytes,
              ),
            ),
          ),
          backgroundDecoration: const BoxDecoration(
            color: AppColors.fontBlack,
          ),
          pageController: PageController(initialPage: initialIndex),
          onPageChanged: onPageChanged,
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "${currentIndex + 1} / ${galleryItems.length}",
              style: TextStyle(
                color: AppColors.white,
                fontSize: duSetFontSize(17),
                decoration: null,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
