import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String day;
  final double value;
  final double percentage;
  const ChartBar({
    this.day,
    this.value,
    this.percentage,
  });
  String get valueString {
    return value.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          child: FittedBox(
            child: Text(
              valueString,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 60,
          width: 12,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromRGBO(220, 220, 220, 1),
                ),
              ),
              FractionallySizedBox(
                heightFactor: percentage,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).primaryColor),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 20,
          child: Text(day),
        )
      ],
    );
  }
}
