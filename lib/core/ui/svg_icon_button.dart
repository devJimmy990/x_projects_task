import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIconButton extends StatelessWidget {
  final String icon;
  final double? size;
  final Color? color;
  final bool? isSelected;
  final void Function()? onTap;

  const SvgIconButton({
    super.key,
    this.size,
    this.color,
    this.onTap,
    required this.icon,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final iconColor =
        isSelected == true
            ? const Color.fromRGBO(20, 30, 40, 1)
            : color ?? const Color.fromRGBO(20, 30, 40, 0.48);

    return IconButton(
      key: super.key,
      icon: SvgPicture.asset(
        icon,
        width: size ?? 24.w,
        height: size ?? 22.h,
        colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
      ),
      onPressed: onTap,
    );
  }
}
