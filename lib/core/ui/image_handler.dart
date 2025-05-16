import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:x_projects_task/core/constants/assets_manager.dart';

class ImageHandler extends StatelessWidget {
  final String url;
  final double width, height;
  final BoxFit fit;
  const ImageHandler(
    this.url, {
    super.key,
    this.width = 100,
    this.height = 100,
    this.fit = BoxFit.fill,
  });

  @override
  Widget build(BuildContext context) {
    final isNetworkImage =
        url.isNotEmpty && Uri.tryParse(url)?.isAbsolute == true;
    return isNetworkImage
        ? Image.network(
          url,
          width: width,
          height: height,
          fit: fit,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            debugPrint('Failed to load image: $url');
            return Image.asset(
              AssetsManager.assetsImagesNewsDummy,
              width: width,
              height: height,
              fit: fit,
            );
          },
        )
        : Image.asset(
          url.isNotEmpty ? url : AssetsManager.assetsImagesNewsDummy,
          width: width,
          height: height,
          fit: BoxFit.fill,
        );
  }
}
