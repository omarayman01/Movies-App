import 'package:flutter/material.dart';
import 'package:movies_app/view/app_theme.dart';

class SearchTextForm extends StatelessWidget {
  const SearchTextForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: AppTheme.bckGround,
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
    );
  }
}
