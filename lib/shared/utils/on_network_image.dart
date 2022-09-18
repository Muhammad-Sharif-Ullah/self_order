import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnNetWorkImage extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final BoxShape? shape;
  final BoxFit? fit;
  final Widget? errorWidget;
  final Color? backgroundColor;

  const OnNetWorkImage(
      {Key? key,
      required this.url,
      this.height,
      this.width,
      this.shape,
      this.backgroundColor,
      this.errorWidget,
      this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      color: backgroundColor,
      width: width,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          shape: shape ?? BoxShape.rectangle,
          image: DecorationImage(
            image: imageProvider,
            fit: fit ?? BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Container(
        alignment: Alignment.center,
        color: Colors.grey.shade200,
        // color: Colors.grey.withOpacity(0.1),

        child: Opacity(
          opacity: 0.2,
          child: Icon(
            CupertinoIcons.photo,
            size: 50.r,
          ),
        ),
      ),
      errorWidget: (context, url, error) => Expanded(
        child: errorWidget ??
            Container(
              alignment: Alignment.center,
              color: Colors.grey.shade200,
              // color: Colors.grey.withOpacity(0.1),

              child: Opacity(
                opacity: 0.2,
                child: Icon(
                  CupertinoIcons.photo,
                  size: 50.r,
                ),
              ),
            ),
      ),
    );
  }
}
