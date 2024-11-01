import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_roots_2/constants/screen_sizes.dart';

import '../../common/app_name/app_name_main.dart';
import '../../common/locale_dropdown/locale_dropdown_main.dart';
import '../offers/offers_main.dart';
import '../setup/setup_main.dart';

class CustomerNavigationNotLogged extends StatefulWidget {
  const CustomerNavigationNotLogged({super.key});

  @override
  State<CustomerNavigationNotLogged> createState() =>
      _CustomerNavigationNotLoggedState();
}

class _CustomerNavigationNotLoggedState
    extends State<CustomerNavigationNotLogged> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const CustomerOffers(),
    const Placeholder(),
    const CustomerSetupMain(),
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
          icon: const Icon(Icons.local_offer_outlined),
          label: AppLocalizations.of(context)!.home,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.search_outlined),
          label: AppLocalizations.of(context)!.search,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.info_outline),
          label: AppLocalizations.of(context)!.about,
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
            icon: const Icon(Icons.local_offer_outlined),
            label: Text(AppLocalizations.of(context)!.home),
          ),
          NavigationRailDestination(
            icon: const Icon(Icons.search_outlined),
            label: Text(AppLocalizations.of(context)!.search),
          ),
          NavigationRailDestination(
            icon: const Icon(Icons.info_outline),
            label: Text(AppLocalizations.of(context)!.about),
          ),
        ],
      ),
    );
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
