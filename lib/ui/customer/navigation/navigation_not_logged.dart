import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_roots_2/constants/screen_sizes.dart';

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
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
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

          // title: const FarmerAppTitle(),
          //
          // actions: [
          //   const LocaleChangeButton(),
          //   // const SizedBox(
          //   //   width: 10,
          //   // ),
          //   IconButton(
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => const CustomerSalesLocationsMap(),
          //         ),
          //       );
          //     },
          //     icon: const Icon(Icons.map_outlined),
          //   )
          // ],
          ),
      body: _screens[_currentIndex],
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _largeScreenNotLogged() {
    return Scaffold(
      appBar: AppBar(
          //leading: Image.asset('assets/images/logo_512.png'),
          // title: const FarmerAppTitle(),
          // actions: [
          //   const LocaleChangeButton(),
          //   IconButton(
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => const CustomerSalesLocationsMap(),
          //         ),
          //       );
          //     },
          //     icon: const Icon(Icons.map_outlined),
          //   )
          // ],
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
