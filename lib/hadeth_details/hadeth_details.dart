import 'package:flutter/material.dart';
import 'package:islami_app/home/hadeth/hadeth.dart';
import 'package:provider/provider.dart';

import '../providers/settings_provider.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = 'hadeth-details';

  @override
  Widget build(BuildContext context) {
    var settingProvider = Provider.of<SettingsProvider>(context);

    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(settingProvider.getMAinBackgroundImage()),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text(args.title),
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
              elevation: 15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    args.content,
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
