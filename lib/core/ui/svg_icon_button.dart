import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIconButton extends StatelessWidget {
  final String icon;
  final double? size;
  final bool isSelected;
  final VoidCallback onTap;

  const SvgIconButton({
    super.key,
    this.size,
    required this.icon,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: size ?? 24.r,
        backgroundColor: Colors.transparent,
        child: SvgPicture.asset(
          icon,
          width: size != null ? size! - 10 : 24.w,
          height: size != null ? size! - 10 : 22.h,
          colorFilter:
              isSelected
                  ? ColorFilter.mode(
                    Color.fromRGBO(20, 30, 40, 1),
                    BlendMode.srcIn,
                  )
                  : ColorFilter.mode(
                    Color.fromRGBO(20, 30, 40, 0.48),
                    BlendMode.srcIn,
                  ),
        ),
      ),
    );
  }
}
