import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_projects_task/features/settings/model/option_model.dart';

class SettingsOptionsCard extends StatelessWidget {
  final List<OptionModel> options;
  final String groupValue;
  final ValueChanged<String?> onChanged;
  final String? title;

  const SettingsOptionsCard({
    super.key,
    required this.options,
    required this.onChanged,
    required this.groupValue,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null)
              Text(title!, style: const TextStyle(fontWeight: FontWeight.bold)),
            ...options.map(
              (e) => RadioListTile<String>(
                value: e.value,
                groupValue: groupValue,
                onChanged: onChanged,
                title: Text(e.title),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
