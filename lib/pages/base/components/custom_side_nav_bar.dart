import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:robot_launcher/components/company_logo.dart';
import 'package:robot_launcher/constants.dart';
import 'package:robot_launcher/pages/base/components/nav_bar_item.dart';
import 'package:robot_launcher/utils/enums.dart';

class CustomSideNavBar extends StatefulWidget {
  const CustomSideNavBar({
    Key? key,
  }) : super(key: key);

  @override
  _CustomSideNavBarState createState() => _CustomSideNavBarState();
}

class _CustomSideNavBarState extends State<CustomSideNavBar> {
  void updateState(MenuState state) {
    setState(() {
      selected = state;
    });
  }

  var selected = defaultMenuState;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
          ),
          color: sideBarColor,
        ),
        child: Column(
          children: [
            CompanyLogo(),
            NavBarItem(
              icon: LineIcons.terminal,
              label: 'Execução',
              color: MenuState.runnning == selected
                  ? selectedItemColor
                  : itemColor,
              action: () {
                if (selected != MenuState.runnning) {
                  controller.toggle(MenuState.runnning);
                  updateState(MenuState.runnning);
                }
              },
            ),
            NavBarItem(
              icon: LineIcons.cog,
              label: 'Configuração',
              color: MenuState.settings == selected
                  ? selectedItemColor
                  : itemColor,
              action: () {
                if (selected != MenuState.settings) {
                  controller.toggle(MenuState.settings);
                  updateState(MenuState.settings);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
