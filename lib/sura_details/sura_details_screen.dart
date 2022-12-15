import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/sura_details/sura_details_arguments.dart';
import 'package:islami_app/sura_details/verse_widget.dart';
import 'package:provider/provider.dart';

import '../providers/settings_provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura-details-screen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var settingProvider = Provider.of<SettingsProvider>(context);

    SuraDetailsScreenArgs args =
        ModalRoute.of(context)?.settings.arguments as SuraDetailsScreenArgs;
    if (verses.isEmpty) readFile(args.index + 1);
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(settingProvider.getMAinBackgroundImage()),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text(args.name),
          ),
          body: verses.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
                  elevation: 15,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListView.separated(
                    itemBuilder: (_, index) {
                      return VerseWidget(verses[index], index + 1);
                    },
                    itemCount: verses.length,
                    separatorBuilder: (_, __) {
                      return Container(
                        color: Theme.of(context).accentColor,
                        height: 1,
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                      );
                    },
                  ),
                ),
        ));
  }

  void readFile(int fileIndex) async {
    String fileContent =
        await rootBundle.loadString('assets/files/$fileIndex.txt');
    List<String> lines = fileContent.trim().split('\n');
    setState(() {
      verses = lines;
    });
  }
}
