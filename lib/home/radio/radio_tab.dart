import 'package:flutter/material.dart';
import 'package:islami_app/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var settingProvider = Provider.of<SettingsProvider>(context);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(settingProvider.isDarkMood()
              ? 'assets/images/radio_image_dark.png'
              : 'assets/images/radio_image.png'),
          Text(
            'إذاعة القرآن الكريم',
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }
}
