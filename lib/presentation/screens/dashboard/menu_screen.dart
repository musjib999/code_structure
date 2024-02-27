import 'package:flutter/material.dart';

class AppMenu extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_) => const AppMenu());
  const AppMenu({super.key});

  @override
  State<AppMenu> createState() => _AppMenuState();
}

class _AppMenuState extends State<AppMenu> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [Container(), Container(), Container(), Container()]
          .elementAt(_selectedIndex),
      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(seconds: 1),
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: Icon(
              _selectedIndex == 0 ? Icons.dashboard : Icons.dashboard_outlined,
              color: _selectedIndex == 0
                  ? Theme.of(context).primaryColor
                  : Colors.green,
            ),
            label: 'Dashboard',
            tooltip: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(
              _selectedIndex == 1
                  ? Icons.shopping_bag
                  : Icons.shopping_bag_outlined,
              color: _selectedIndex == 1
                  ? Theme.of(context).primaryColor
                  : Colors.green,
            ),
            label: 'Bookings',
            tooltip: 'Bookings',
          ),
          NavigationDestination(
            icon: Icon(
              _selectedIndex == 3 ? Icons.policy : Icons.policy_outlined,
              color: _selectedIndex == 3
                  ? Theme.of(context).primaryColor
                  : Colors.green,
            ),
            label: _selectedIndex == 2 ? 'Fleets' : '',
            tooltip: 'Fleets',
          ),
          NavigationDestination(
            icon: Icon(
              _selectedIndex == 3 ? Icons.person : Icons.person_outline,
              color: _selectedIndex == 3
                  ? Theme.of(context).primaryColor
                  : Colors.green,
            ),
            label: _selectedIndex == 3 ? 'Me' : '',
            tooltip: 'Account',
          ),
        ],
      ),
    );
  }
}
