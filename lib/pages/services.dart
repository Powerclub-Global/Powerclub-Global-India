import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../widgets/footer.dart';
import '../widgets/drawer.dart';

class ServicesPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Map<String, dynamic>> services = [
    {
      "title": "Branding",
      "description": "Building your brand identity and strategy.",
      "icon": Icons.brush,
    },
    {
      "title": "Web Development",
      "description":
          "Custom websites and web applications tailored to your needs.",
      "icon": Icons.web,
    },
    {
      "title": "Social Media",
      "description":
          "Engaging your audience through powerful social media strategies.",
      "icon": Icons.share,
    },
    {
      "title": "Experiences",
      "description": "Creating unforgettable experiences and events.",
      "icon": Icons.event_available,
    },
    {
      "title": "Marketing",
      "description":
          "Comprehensive marketing services to grow your visibility.",
      "icon": Icons.trending_up,
    },
    {
      "title": "Press",
      "description": "Managing press relations and communications.",
      "icon": Icons.record_voice_over,
    },
    // Add more services as needed
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Align text center
            children: [
              Text(
                'Our Services',
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                'We offer a wide range of services to help you achieve your goals:',
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
                itemCount: services.length,
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
                      leading: Icon(services[index]["icon"], color: themeColor),
                      title: Text(services[index]["title"],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: textColor)),
                      subtitle: Text(services[index]["description"],
                          style: TextStyle(color: textColor)),
                    ),
                  );
                },
              ),
              SizedBox(height: 40),
              Footer(), // Place Footer here directly in the layout
            ],
          ),
        ),
      ),
    );
  }
}
