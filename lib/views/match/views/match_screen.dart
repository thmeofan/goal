import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goal/consts/app_colors.dart';
import 'package:goal/consts/app_text_styles/settings_text_style.dart';
import 'package:goal/views/news/views/news_screen.dart';
import 'package:goal/views/settings/views/settings_screen.dart';
import '../../../data/model/news_model.dart';
import '../../../data/repository/api_repository.dart';
import '../widgets/match_widget.dart';

class MatchScreen extends StatelessWidget {
  final ApiRepository apiRepository = ApiRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsScreen(),
                  ),
                );
              },
              icon: SvgPicture.asset('assets/icons/settings.svg'))
        ],
      ),
      body: Container(
        color: AppColors.blackColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Matches',
                style: SettingsTextStyle.title,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.greenColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/matches.svg',
                          color: AppColors.whiteColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'History matches',
                          style: SettingsTextStyle.bannerChosen,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsScreen(newsModel: news),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/news.svg',
                            color: AppColors.whiteColor.withOpacity(0.4),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            'News',
                            style: SettingsTextStyle.bannerNotChosen,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            FutureBuilder<List<dynamic>>(
              future: apiRepository.fetchMatches(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final matches = snapshot.data!;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: matches.length,
                      itemBuilder: (context, index) {
                        final match = matches[index];
                        return MatchWidget(match: match);
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Failed to load matches'));
                }
                return const Center(
                    child: CircularProgressIndicator(
                  color: AppColors.greenColor,
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
