import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_roots_2/constants/screen_sizes.dart';

import '../../common/app_name/app_name_main.dart';
import '../../common/locale_dropdown/locale_dropdown_main.dart';
import '../farm/farm_main.dart';
import '../offers/new_offer/offer_new_main.dart';
import '../offers/offers/offers_main.dart';
import '../setup/setup_main.dart';

class FarmerNavigationBoarded extends StatefulWidget {
  const FarmerNavigationBoarded({super.key});

  @override
  State<FarmerNavigationBoarded> createState() =>
      _FarmerNavigationBoardedState();
}

class _FarmerNavigationBoardedState extends State<FarmerNavigationBoarded> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const FarmerOffers(),
    const FarmerFarmMain(),
    const FarmerSetupMain(),
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
          label: AppLocalizations.of(context)!.offers,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.nature_people_outlined),
          label: AppLocalizations.of(context)!.farm,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.settings_outlined),
          label: AppLocalizations.of(context)!.config,
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
            label: Text(AppLocalizations.of(context)!.offers),
          ),
          NavigationRailDestination(
            icon: const Icon(Icons.nature_people_outlined),
            label: Text(AppLocalizations.of(context)!.farm),
          ),
          NavigationRailDestination(
            icon: const Icon(Icons.settings_outlined),
            label: Text(AppLocalizations.of(context)!.config),
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
                builder: (context) => const FarmerOfferNew(),
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
