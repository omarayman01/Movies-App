import 'package:flutter/material.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 1,
          crossAxisSpacing: 10,
          childAspectRatio: 2.8 / 2),
      itemCount: 10,
      itemBuilder: (BuildContext context, index) {
        return Stack(
          children: [
            SizedBox(
              child: Image.asset('assets/pics/Image2.png'),
            ),
            Center(
              child: Text(
                'Action',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        );
      },
    );
  }
}
