import 'package:flutter/material.dart';
import 'package:pcg/change_notifiers/video_notifier.dart';
import 'package:pcg/theme/theme_manager.dart';
import 'package:pcg/widgets/drawer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:appinio_video_player/appinio_video_player.dart';
import '../widgets/appbar.dart';
import '../widgets/footer.dart';
import '../widgets/home_results.dart';
import '../widgets/home_video.dart';
import '../widgets/home_insights.dart';
import '../widgets/home_connect.dart';
import '../widgets/home_newsletter.dart';



class Home extends StatelessWidget {
  final PageController _pageController =
      PageController(initialPage: 500, viewportFraction: .33);
  double currentPageValue = 500.0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _openWebsiteInWebView(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true, enableJavaScript: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(
          scaffoldKey: _scaffoldKey,
        ),
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 500,
              child: Image.asset(
                  'assets/hero_image${themeManager.isDarkMode ? "_b" : ""}.png',
                  fit: BoxFit.fitHeight),
            ),
            Container(
              height: 200.0,
              color: themeManager.isDarkMode ? Colors.black : Colors.white,
              child: PageView.builder(
                controller: _pageController,
                itemCount: 10000,
                itemBuilder: (context, index) {
                  final logoIndex = index % 5;
                  final logoImagePath =
                      'assets/${(logoIndex + 1)}${themeManager.isDarkMode ? "b" : ""}.png';
                  final urls = [
                    'https://ethdenver2023-kingbodhi.vercel.app/',
                    'https://fineartsociety.xyz',
                    'https://crypto-hash-nine.vercel.app/',
                    'https://emergenceiii.vercel.app',
                    'https://yachtmasterapp.com',
                  ];

                  return InkWell(
                    onTap: () async {
                      if (urls.length > logoIndex) {
                        await _openWebsiteInWebView(urls[logoIndex]);
                      }
                    },
                    child: Image.asset(logoImagePath, width: 100.0),
                  );
                },
              ),
            ),
            const ResultsSection(),
            SizedBox(
              height: 30,
            ),
            HomeVideo(
              videoUrl: 'https://www.youtube.com/watch?v=lE23UzCPsVg',
              videoNotifier: videoNotifier,
            ),
            SizedBox(
              height: 40,
            ),
            InsightsSection(),
            SizedBox(
              height: 20,
            ),
            HomeConnect(),
            SizedBox(
              height: 20,
            ),
            HomeNewsletter(),
            SizedBox(
              height: 30,
            ),
            Footer(),
          ],
        ),
      ),
    );
  }
}
