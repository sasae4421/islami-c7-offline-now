import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/home/hadeth/hadeth.dart';
import 'package:islami_app/home/hadeth/hadeth_title_widget.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> allHadethList = [];

  @override
  Widget build(BuildContext context) {
    if (allHadethList.isEmpty) loadHadethFile();

    return Container(
        child: Column(
      children: [
        Image.asset('assets/images/hadeth_header_image.png'),
        Container(
          color: Theme.of(context).accentColor,
          height: 2,
        ),
        Text(
          'الأحاديث',
          style: Theme.of(context).textTheme.headline4,
        ),
        Container(
          color: Theme.of(context).accentColor,
          height: 2,
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (buildContext, index) {
              return HadethTitleWidget(allHadethList[index]);
            },
            itemCount: allHadethList.length,
            separatorBuilder: (_, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                color: Theme.of(context).accentColor,
                height: 1,
              );
            },
          ),
        ),
      ],
    ));
  }

  void loadHadethFile() async {
    List<Hadeth> hadethList = [];
    String content = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> allHadethContent = content.split("#");
    for (int i = 0; i < allHadethContent.length; i++) {
      String singleHadeth = allHadethContent[i].trim();

      List<String> singleHadethLines = singleHadeth.trim().split("\n");
      String title = singleHadethLines[0];
      singleHadethLines.removeAt(0);
      String content = singleHadethLines.join("\n");
      Hadeth h = Hadeth(title, content);
      hadethList.add(h);
    }

    setState(() {
      allHadethList = hadethList;
    });
  }
}
