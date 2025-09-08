import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex_app/features/home/presentations/bloc/bottomnavbar_bloc.dart';
import 'package:pokedex_app/features/home/presentations/pages/favorite_page.dart';
import 'package:pokedex_app/features/home/presentations/pages/home_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final List<Widget> listPage = const [
    HomePage(),
    FavoritePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomnavbarBloc, BottomnavbarState>(
      builder: (context, state) {
        int currentIndex = 0;
        if (state is BottomnavbarInitial) {
          currentIndex = state.index;
        }
        return Scaffold(
            body: listPage[currentIndex],
            bottomNavigationBar: SizedBox(
              height: 72,
              child: BottomNavigationBar(
                currentIndex: currentIndex,
                onTap: (index) {
                  // context.read<BottomnavbarBloc>().add(BottomNavbarTap(index));
                },
                items: [
                  BottomNavigationBarItem(
                    icon: currentIndex == 0
                        ? SvgPicture.asset(
                            'assets/images/ic_botnav_poke_active.svg')
                        : SvgPicture.asset(
                            'assets/images/ic_botnav_poke_inactive.svg'),
                    label: currentIndex == 0 ? 'Pokedex' : '',
                  ),
                  BottomNavigationBarItem(
                    icon: currentIndex == 1
                        ? SvgPicture.asset(
                            'assets/images/ic_botnav_heart_active.svg')
                        : SvgPicture.asset(
                            'assets/images/ic_botnav_heart_inactive.svg'),
                    label: currentIndex == 1 ? 'Favorit' : '',
                  ),
                ],
              ),
            ));
      },
    );
  }
}
