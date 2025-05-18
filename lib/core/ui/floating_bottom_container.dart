import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_projects_task/core/constants/colors_manager.dart';

class FloatingBottomContainer extends StatelessWidget {
  final List<Widget> children;
  const FloatingBottomContainer({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Card(
        elevation: 5,
        color: ColorsManager.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28.r),
        ),
        margin: EdgeInsets.only(bottom: 18.h),
        child: Row(mainAxisSize: MainAxisSize.min, children: children),
      ),
    );
  }
}
