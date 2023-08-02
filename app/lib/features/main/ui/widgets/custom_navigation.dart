import 'package:app/core/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavigation {
  int getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    if (location == ProfileRoute.path) {
      return 1;
    }
    return 0;
  }

  void goTo(int index, BuildContext context) {
    switch (index) {
      case 0:
        const BudgetRoute('').go(context);
        break;
      case 1:
        const ProfileRoute().go(context);
        break;
    }
  }

  Widget rail(BuildContext context) {
    final selectedIndex = getCurrentIndex(context);

    return NavigationRail(
      destinations: const <NavigationRailDestination>[
        NavigationRailDestination(
          icon: Icon(Icons.balance_outlined),
          selectedIcon: Icon(Icons.balance),
          label: Text('Budgets'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person),
          label: Text('Profile'),
        ),
      ],
      selectedIndex: selectedIndex,
      onDestinationSelected: (int index) {
        goTo(index, context);
      },
    );
  }

  Widget bottomBar(BuildContext context) {
    final selectedIndex = getCurrentIndex(context);

    return BottomNavigationBar(
      currentIndex: selectedIndex,
      items: const [
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.balance),
          icon: Icon(Icons.balance_outlined),
          label: 'Budgets',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.person),
          icon: Icon(Icons.person_outline),
          label: 'Profile',
        )
      ],
      onTap: (index) => goTo(index, context),
    );
  }
}
