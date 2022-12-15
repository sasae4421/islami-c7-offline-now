import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
                onTap: () {
                  settingsProvider.changeTheme(ThemeMode.light);
                },
                child: settingsProvider.isDarkMood()
                    ? getUnSelectedItem(AppLocalizations.of(context)!.light)
                    : getSelectedItem(AppLocalizations.of(context)!.light)),
            const SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () {
                  settingsProvider.changeTheme(ThemeMode.dark);
                },
                child: settingsProvider.isDarkMood()
                    ? getSelectedItem(AppLocalizations.of(context)!.dark)
                    : getUnSelectedItem(AppLocalizations.of(context)!.dark))
          ],
        ),
      ),
    );
  }

  Widget getSelectedItem(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline4?.copyWith(
                color: Theme.of(context).accentColor,
              ),
        ),
        Icon(
          Icons.check,
          color: Theme.of(context).accentColor,
        ),
      ],
    );
  }

  Widget getUnSelectedItem(String title) {
    return Text(title, style: Theme.of(context).textTheme.headline4);
  }
}
