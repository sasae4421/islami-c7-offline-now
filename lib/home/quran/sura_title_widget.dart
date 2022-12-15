import 'package:flutter/material.dart';
import 'package:islami_app/sura_details/sura_details_arguments.dart';
import 'package:islami_app/sura_details/sura_details_screen.dart';

class SuraTitleWidget extends StatelessWidget {
  String title;
  int index;
  String times;

  SuraTitleWidget(this.title, this.times, this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            SuraDetailsScreen.routeName,
            arguments: SuraDetailsScreenArgs(name: title, index: index),
          );
        },
        child: Table(
            border: TableBorder.symmetric(
                inside:
                    BorderSide(width: 2, color: Theme.of(context).accentColor)),
            children: [
              TableRow(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 7),
                    child: Center(
                      child: Text(
                        times,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ],
              ),
            ]));
  }
}
