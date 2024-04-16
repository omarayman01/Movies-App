import 'package:flutter/material.dart';

class MovieDisc extends StatelessWidget {
  const MovieDisc({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 19),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Image(
                image: AssetImage('assets/pics/star-2.png'),
              ),
              const SizedBox(
                width: 5,
              ),
              Text('7.7',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 8)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 19),
          child: Text('Deadpool 2',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 10)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 19),
          child: Text('2018  R  1h 59m',
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 8)),
        ),
      ],
    );
  }
}
