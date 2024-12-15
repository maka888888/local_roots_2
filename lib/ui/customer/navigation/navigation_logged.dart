import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/constants/screen_sizes.dart';
import 'package:local_roots_2/providers/customer/orders/orders_stream.dart';

import '../../common/app_name/app_name_main.dart';
import '../common/orders_widgets/orders_in_selection_icon/orders_in_selection_icon.dart';
import '../offers/offers_main.dart';
import '../search/search_main.dart';
import '../setup/setup_main.dart';

class CustomerNavigationLogged extends ConsumerStatefulWidget {
  const CustomerNavigationLogged({super.key});

  @override
  CustomerNavigationLoggedState createState() =>
      CustomerNavigationLoggedState();
}

class CustomerNavigationLoggedState
    extends ConsumerState<CustomerNavigationLogged> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const CustomerOffers(),
    const CustomerSearch(),
    const CustomerSetupMain(),
  ];

  @override
  initState() {
    super.initState();
    ref.read(refCustomerOrdersStreamProvider.future).then((value) {});
  }

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
            icon: const Icon(Icons.local_offer_outlined),
            label: Text(AppLocalizations.of(context)!.home),
          ),
          NavigationRailDestination(
            icon: const Icon(Icons.search_outlined),
            label: Text(AppLocalizations.of(context)!.search),
          ),
          NavigationRailDestination(
            icon: const Icon(Icons.settings_outlined),
            label: Text(AppLocalizations.of(context)!.setup),
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
          CustomerOrdersInSelectionIcon(),
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
          CustomerOrdersInSelectionIcon(),
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
          Expanded(
            child: Center(
              child: ConstrainedBox(
                constraints:
                    const BoxConstraints(maxWidth: ScreenSizes.smallScreen),
                child: Center(child: _screens[_currentIndex]),
              ),
            ),
          ),
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
