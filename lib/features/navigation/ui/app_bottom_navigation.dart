import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:moamo/features/navigation/ui/widgets/navigation_button.dart';
import 'package:moamo/shared/app_base_sizes.dart';
import 'package:moamo/shared/app_colors.dart';
import '../model/navigation_item.dart';

class AppBottomNavigation extends StatelessWidget {
  const AppBottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  final int selectedIndex;
  final ValueChanged<int> onTap;

  static const _items = [
    NavigationItem(
      label: '서재',
      iconPath: 'assets/icons/home_none.svg',
      activeIconPath: 'assets/icons/home_active.svg',
    ),
    NavigationItem(
      label: '커뮤니티',
      iconPath: 'assets/icons/community_none.svg',
      activeIconPath: 'assets/icons/community_active.svg',
    ),
    NavigationItem(
      label: '인증',
      iconPath: 'assets/icons/certification_none.svg',
      activeIconPath: 'assets/icons/certification_active.svg',
    ),
    NavigationItem(
      label: '마이',
      iconPath: 'assets/icons/my_none.svg',
      activeIconPath: 'assets/icons/my_active.svg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.neutral10)),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(60, 60, 60, 0.04),
            blurRadius: 8,
            spreadRadius: 0,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height:
              AppBaseSizes.bottomNavigationBarHeight +
              MediaQuery.paddingOf(context).bottom / 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                // [
                //   NavigationButton(
                //     item: _items[0],
                //     isSelected: true,
                //     onTap: () => {},
                //   ),
                //   SizedBox(width: 48),
                //   NavigationButton(
                //     item: _items[1],
                //     isSelected: false,
                //     onTap: () => {},
                //   ),
                //   SizedBox(width: 48),
                //   NavigationButton(
                //     item: _items[2],
                //     isSelected: false,
                //     onTap: () => {},
                //   ),
                //   SizedBox(width: 48),
                //   NavigationButton(
                //     item: _items[3],
                //     isSelected: false,
                //     onTap: () => {},
                //   ),
                // ],
                _items
                    .mapIndexed(
                      (i, e) => Expanded(
                        child: NavigationButton(
                          item: e,
                          isSelected: i == selectedIndex,
                          onTap: () => onTap(i),
                        ),
                      ),
                    )
                    .toList(),
          ),
        ),
      ),
    );
  }
}
