import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../consts/app_text_styles/settings_text_style.dart';

class SettingsTile extends StatelessWidget {
  final String assetName;
  final String text;
  final VoidCallback? onTap;
  final Widget? action;

  const SettingsTile({
    super.key,
    required this.assetName,
    required this.text,
    this.onTap,
    this.action,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              SvgPicture.asset(
                assetName,
                width: 24.0,
                height: 24.0,
              ),
              SizedBox(width: 8.0),
              Text(
                text,
                style: SettingsTextStyle.tile,
              ),
              if (action != null) ...[
                Spacer(),
                action!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
