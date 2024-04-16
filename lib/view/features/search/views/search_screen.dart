import 'package:flutter/material.dart';
import 'package:movies_app/view/app_theme.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(19),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: AppTheme.bckGround, // Background color red
                border: Border.all(
                  color: AppTheme.bckGround,
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextFormField(
                  style: TextStyle(color: AppTheme.white),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppTheme.white,
                      size: 28,
                    ),
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    hintText: 'Search',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 250,
            ),
            Center(child: Image.asset('assets/pics/Group 22.png'))
          ],
        ),
      ),
    );
  }
}
