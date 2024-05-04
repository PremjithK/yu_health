import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yu_health/core/config/layout.dart';

class FiltersBar extends StatelessWidget {
  const FiltersBar({
    super.key,
    required this.children,
    required this.onCleared,
    required this.tagList,
    this.controller,
  });

  final List<Widget> children;
  final List<dynamic> tagList;
  final void Function() onCleared;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              controller: controller,
              clipBehavior: Clip.hardEdge,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: children,
            ),
          ),
          ValueListenableBuilder<int>(
            valueListenable: ValueNotifier<int>(tagList.length),
            builder: (context, value, _) {
              if (value > 0) {
                return IconButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(
                        Theme.of(context).colorScheme.error),
                    side: MaterialStatePropertyAll(BorderSide(
                        color: Theme.of(context)
                            .colorScheme
                            .error
                            .withOpacity(0.5))),
                  ),
                  icon: const Icon(Icons.close),
                  onPressed: onCleared,
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}

class FilterItem extends StatelessWidget {
  const FilterItem({
    super.key,
    required this.label,
    required this.selected,
    this.onSelected,
  });

  final String label;
  final bool selected;
  final void Function(bool value)? onSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: FilterChip(
        label: Text(
          label,
          style: TextStyle(
            color: selected ? theme.onPrimary : theme.primary,
          ),
        ),
        color: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return theme.primary;
          } else {
            return theme.background;
          }
        }),
        selected: selected,
        showCheckmark: false,
        onSelected: onSelected,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ButtonLayout.borderRadius),
        ),
        side: BorderSide(
          color: selected
              ? Colors.transparent
              : theme.onBackground.withOpacity(0.15),
        ),
        avatarBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ButtonLayout.borderRadius),
        ),
      ),
    );
  }
}
