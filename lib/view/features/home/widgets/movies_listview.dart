import 'package:flutter/material.dart';
import 'package:movies_app/view/app_theme.dart';

class MoviesListView extends StatelessWidget {
  const MoviesListView({super.key, required this.text, required this.widget});
  final String text;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.bckGround,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 19, top: 10, bottom: 10),
            child: Text(text, style: Theme.of(context).textTheme.bodyLarge),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 19, bottom: 8),
                    child: widget,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
