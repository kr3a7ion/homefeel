import 'package:bmg/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ApartmentSearch extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Appcolors.whitebackground,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none,
        ));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      query.isNotEmpty
          ? IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.clear,
                size: 28,
              ))
          : const SizedBox.shrink(),
      IconButton(onPressed: () {}, icon: const Icon(IconlyBroken.filter))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, query);
        },
        icon: const Icon(
          IconlyBroken.arrow_left,
          size: 28,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox.shrink();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView();
  }
}
