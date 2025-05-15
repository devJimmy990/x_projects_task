import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NearestNewsItemShimmerCard extends StatelessWidget {
  const NearestNewsItemShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Container(
          height: 300.h,
          width: 300.w,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsetsDirectional.only(
              start: 24.w,
              end: 14.w,
              top: 12.h,
              bottom: 12.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _shimmerBox(width: 80.w, height: 16.h),
                    _shimmerBox(width: 50.w, height: 12.h),
                  ],
                ),
                const Spacer(),

                Padding(
                  padding: EdgeInsetsDirectional.only(end: 10.w),
                  child: _shimmerBox(width: double.infinity, height: 50.h),
                ),
                SizedBox(height: 12.h),

                Row(
                  children: [
                    _circleShimmer(24),
                    SizedBox(width: 10.w),
                    _circleShimmer(24),
                    const Spacer(),
                    _circleShimmer(24),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _shimmerBox({required double width, required double height}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(8.r),
      ),
    );
  }

  Widget _circleShimmer(double size) {
    return Container(
      width: size.w,
      height: size.h,
      decoration: const BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
