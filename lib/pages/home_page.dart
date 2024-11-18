import 'package:flutter/material.dart';
import 'package:learning/constants/colors.dart';
import 'package:learning/constants/size.dart';
import 'package:learning/constants/sns_links.dart';
import 'package:learning/widgets/contact_section.dart';
import 'package:learning/widgets/drawer_mobile.dart';
import 'package:learning/widgets/footer.dart';
import 'package:learning/widgets/header_desktop.dart';
import 'package:learning/widgets/header_mobile.dart';
import 'package:learning/widgets/main_desktop.dart';
import 'package:learning/widgets/main_mobile.dart';
import 'package:learning/widgets/projects_section.dart';
import 'package:learning/widgets/skills_destop.dart';
import 'package:learning/widgets/skills_mobile.dart';
import 'dart:js' as js;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(4, (index) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: scaffoldKey,
        backgroundColor: CustomColor.scaffoldBg,
        endDrawer: constraints.maxWidth >= kMainDesktopWidth
            ? null
            : DrawerModile(onNavItemTap: (int navIndex) {
                scaffoldKey.currentState?.closeEndDrawer();
                scrollToSection(navIndex);
              }),
        body: SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(key: navbarKeys.first),

              // MAIN
              if (constraints.maxWidth >= kMainDesktopWidth)
                HeaderDesktop(onNavItemTap: (int navIndex) {
                  scrollToSection(navIndex);
                })
              else
                HeaderMobile(
                  onLogoTap: () {},
                  onmenuTap: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                ),

              if (constraints.maxWidth >= kMainDesktopWidth)
                const MainDesktop()
              else
                const MainMobile(),

              // SKILLS
              Container(
                key: navbarKeys[1],
                width: screenWidth,
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                color: CustomColor.bgLight1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // title
                    const Text(
                      "What I can do",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary,
                      ),
                    ),
                    const SizedBox(height: 50),

                    // platforms and skills
                    if (constraints.maxWidth >= kMedDesktopWidth)
                      const SkillsDestop()
                    else
                      const SkillsMobile(),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // PROJECTS
              ProjectsSection(
                key: navbarKeys[2],
              ),

              const SizedBox(height: 30),

              // CONTACT
              ContactSection(
                key: navbarKeys[3],
              ),
              const SizedBox(height: 30),

              // FOOTER
              const Footer(),
            ],
          ),
        ),
      );
    });
  }

  void scrollToSection(int navIndex) {
    if (navIndex == 4) {
      // open a blog page
      js.context.callMethod('open', [SnsLinks.blog]);
      return;
    }

    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
