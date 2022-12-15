import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
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
                settingsProvider.changeLanguage('en');
              },
              child: settingsProvider.isEnglish()
                  ? getSelectedItem(AppLocalizations.of(context)!.english)
                  : getUnSelectedItem(AppLocalizations.of(context)!.english),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () {
                  settingsProvider.changeLanguage('ar');
                },
                child: settingsProvider.isEnglish()
                    ? getUnSelectedItem(AppLocalizations.of(context)!.arabic)
                    : getSelectedItem(AppLocalizations.of(context)!.arabic)),
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
