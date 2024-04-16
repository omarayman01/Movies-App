import 'package:flutter/material.dart';
import 'package:movies_app/view/features/browse/widgets/categories_gridview.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 18, right: 18, top: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 10),
        Text(
          'Browse Category',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 25),
        ),
        const Expanded(child: CategoriesGridView())
      ]),
    ));
  }
}
