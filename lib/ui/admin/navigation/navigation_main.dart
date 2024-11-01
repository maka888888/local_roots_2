import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_roots_2/constants/screen_sizes.dart';

import '../../common/app_name/app_name_main.dart';
import '../../common/locale_dropdown/locale_dropdown_main.dart';
import '../setup/setup_main.dart';
import '../users/user_new.dart';
import '../users/users_main.dart';

class AdminNavigation extends StatefulWidget {
  const AdminNavigation({super.key});

  @override
  State<AdminNavigation> createState() => _AdminNavigationState();
}

class _AdminNavigationState extends State<AdminNavigation> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const AdminUsersMain(),
    const Placeholder(),
    const Placeholder(),
    const AdminSetupMain(),
  ];

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.person_outlined),
          label: AppLocalizations.of(context)!.users,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.approval_outlined),
          label: AppLocalizations.of(context)!.approvals,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.shopping_basket_outlined),
          label: AppLocalizations.of(context)!.orders,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.settings_outlined),
          label: AppLocalizations.of(context)!.setup,
        ),
      ],
    );
  }

  Widget _navigationRailNotLogged() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: NavigationRail(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        labelType: NavigationRailLabelType.all,
        destinations: [
          NavigationRailDestination(
            icon: const Icon(Icons.person_outlined),
            label: Text(AppLocalizations.of(context)!.users),
          ),
          NavigationRailDestination(
            icon: const Icon(Icons.approval_outlined),
            label: Text(AppLocalizations.of(context)!.approvals),
          ),
          NavigationRailDestination(
            icon: const Icon(Icons.shopping_basket_outlined),
            label: Text(AppLocalizations.of(context)!.orders),
          ),
          NavigationRailDestination(
            icon: const Icon(Icons.settings_outlined),
            label: Text(AppLocalizations.of(context)!.setup),
          ),
        ],
      ),
    );
  }

  Widget? _floatingActionButton() {
    switch (_currentIndex) {
      case 0:
        return FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AdminAppUserNew(),
              ),
            );
          },
          child: const Icon(Icons.add),
        );

      default:
        return null;
    }
  }

  Widget _smallScreenNotLogged() {
    return Scaffold(
      appBar: AppBar(
        title: const AppNameMain(),
        actions: const [
          SizedBox(
            width: 100,
            child: LocaleDropdownMain(),
          ),
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: _bottomNavigationBar(),
      floatingActionButton: _floatingActionButton(),
    );
  }

  Widget _largeScreenNotLogged() {
    return Scaffold(
      appBar: AppBar(
        title: const AppNameMain(),
        actions: const [
          SizedBox(
            width: 100,
            child: LocaleDropdownMain(),
          ),
        ],
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 135,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: _navigationRailNotLogged(),
            ),
          ),
          Expanded(child: _screens[_currentIndex]),
        ],
      ),
      floatingActionButton: _floatingActionButton(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < ScreenSizes.smallScreen) {
        return _smallScreenNotLogged();
      } else {
        return _largeScreenNotLogged();
      }
    });
  }
}
