import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../widgets/footer.dart';
import '../widgets/drawer.dart';

class IndustriesPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Map<String, dynamic>> industries = [
    {
      "title": "Energy",
      "description":
          "Innovative solutions for sustainable and renewable energy sources.",
      "icon": Icons.flash_on,
    },
    {
      "title": "Agriculture",
      "description":
          "Technologies and strategies for modern, sustainable agriculture.",
      "icon": Icons.eco,
    },
    {
      "title": "Development",
      "description": "Comprehensive land development and urban planning.",
      "icon": Icons.landscape,
    },
    {
      "title": "Transportation",
      "description":
          "Efficient and sustainable transportation solutions for Air, Land, and Sea.",
      "icon": Icons.directions_car,
    },
    {
      "title": "Networking",
      "description":
          "Advanced networking solutions for ISPs and digital infrastructure.",
      "icon": Icons.router,
    },
    {
      "title": "Space",
      "description":
          "Pioneering the final frontier with innovative space technologies.",
      "icon": Icons.rocket_launch,
    },
    {
      "title": "Robotics",
      "description":
          "Cutting-edge robotics for automation, efficiency, and exploration.",
      "icon": Icons.build,
    },
    {
      "title": "Blockchain",
      "description":
          "Secure, decentralized technologies for transactions and contracts.",
      "icon": Icons.account_balance_wallet,
    },
    {
      "title": "Hardware",
      "description": "The latest in computer and IoT device technologies.",
      "icon": Icons.computer,
    },
  ];

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width >= 800;
    final themeColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Color(0xFFB4914C);
    final textColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;

    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(scaffoldKey: _scaffoldKey),
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment
                    .center, // Center alignment for heading and paragraph
                children: [
                  Text(
                    'Industries',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'We support a wide range of industries to build the next economy:',
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isDesktop ? 3 : 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 3,
                    ),
                    itemCount: industries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.black
                              : Colors.white,
                          border: Border.all(color: themeColor),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ListTile(
                          leading: Icon(industries[index]["icon"],
                              color: themeColor),
                          title: Text(industries[index]["title"],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: textColor)),
                          subtitle: Text(industries[index]["description"],
                              style: TextStyle(color: textColor)),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
            Footer(), //
          ],
        ),
      ),
    );
  }
}