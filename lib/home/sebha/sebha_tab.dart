import 'package:flutter/material.dart';
import 'package:islami_app/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class TasbehTab extends StatefulWidget {
  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  double angle = 0.0;
  int currentIndex = 0;
  int counter = 0;
  List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
  ];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var settingProvider = Provider.of<SettingsProvider>(context);
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: mediaQuery.height * 0.38,
            child: Stack(
              children: [
                Positioned(
                  child: Image.asset(
                    settingProvider.isDarkMood()
                        ? 'assets/images/head_of_seb7a_dark.png'
                        : 'assets/images/head_of_seb7a.png',
                    height: mediaQuery.height * 0.1,
                  ),
                  left: mediaQuery.width * 0.46,
                  top: 20,
                ),
                Positioned(
                  top: 78,
                  left: mediaQuery.width * 0.2,
                  child: GestureDetector(
                    onTap: () {
                      onClick();
                    },
                    child: Transform.rotate(
                      angle: angle,
                      child: Image.asset(
                        settingProvider.isDarkMood()
                            ? 'assets/images/body_of_seb7a_dark.png'
                            : 'assets/images/body_of_seb7a.png',
                        height: mediaQuery.height * 0.27,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            'عدد التسبيحات',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: 70,
            height: 80,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor.withOpacity(.6),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              counter.toString(),
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            width: 140,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              azkar[currentIndex],
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  onClick() {
    setState(() {
      counter++;
      angle--;
      if (counter == 33) {
        currentIndex++;
        counter = 0;
      }
      if (currentIndex > azkar.length - 1) {
        currentIndex = 0;
      }
    });
  }
}
