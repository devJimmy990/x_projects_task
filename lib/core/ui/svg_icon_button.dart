import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIconButton extends StatelessWidget {
  final String icon;
  final double? size;
  final Color? color;
  final bool isSelected;
  final VoidCallback onTap;

  const SvgIconButton({
    super.key,
    this.size,
    this.color,
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
          width: size ?? 24.w,
          height: size ?? 22.h,
          colorFilter:
              isSelected
                  ? const ColorFilter.mode(
                    Color.fromRGBO(20, 30, 40, 1),
                    BlendMode.srcIn,
                  )
                  : ColorFilter.mode(
                    color ?? const Color.fromRGBO(20, 30, 40, 0.48),
                    BlendMode.srcIn,
                  ),
        ),
      ),
    );
  }
}
