import 'package:flutter/material.dart';

import '../../providers/theme_color_provider.dart';
import 'package:provider/provider.dart';
import '../../theme/theme.dart';
import 'widget/theme_color_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeColorProvider>();
    // a way for any widget in the tree to acccess the objeect that the provider is holding,
    // <ThemeColorProvider> is the object we want to access,
    // then assign it to themeProvider variable
    // themeProider now points to the same ThemeColorProvider object that ChangeNotifierProvider made.

    return Container(
      color: themeProvider.current.backgroundColor,
      // when we change the themeProvider.current it calls the notifyListener(), which it rebuilds any widget that listen to this provider.
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text(
            "Settings",
            style: AppTextStyles.heading.copyWith(
              color: themeProvider.current.color,
            ),
          ),

          SizedBox(height: 50),

          Text(
            "Theme",
            style: AppTextStyles.label.copyWith(color: AppColors.textLight),
          ),

          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: ThemeColor.values
                .map(
                  (theme) => ThemeColorButton(
                    themeColor: theme,
                    isSelected: theme == themeProvider.current.color,
                    onTap: (value) {
                      themeProvider.current = value;
                      // notifyListeners() is called inside the object.
                    },
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
