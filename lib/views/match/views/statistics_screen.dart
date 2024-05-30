import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goal/consts/app_colors.dart';
import '../../../consts/app_text_styles/match_text_style.dart';
import '../../../consts/app_text_styles/settings_text_style.dart';

class StatisticsScreen extends StatelessWidget {
  final dynamic match;

  StatisticsScreen({required this.match});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.blackColor,
        title: const Text(
          'Game stats',
          style: SettingsTextStyle.back,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset(
            'assets/icons/leading.svg',
            width: size.width * 0.08,
            height: size.width * 0.08,
          ),
        ),
      ),
      body: Container(
        height: size.height * 0.95,
        color: AppColors.blackColor,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/statistics.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          _buildTeamLogo(match['homeTeam']),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            match['homeTeam']?['name'] ?? 'Home Team',
                            style: MatchTextStyle.team,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '${match['score']?['fullTime']?['home'] ?? ''} - ${match['score']?['fullTime']?['away'] ?? ''}', // Add null checks
                      style: MatchTextStyle.score,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          _buildTeamLogo(match['awayTeam']),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            match['awayTeam']?['name'] ?? 'Away Team',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: MatchTextStyle.team,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Statistics',
                      style: MatchTextStyle.title,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        generateRandomPassings().toString(),
                        style: MatchTextStyle.statistics,
                      ),
                      Spacer(),
                      Text(
                        'Passings, %',
                        style: MatchTextStyle.subtitle,
                      ),
                      Spacer(),
                      Text(
                        generateRandomPassings().toString(),
                        style: MatchTextStyle.statistics,
                      )
                    ],
                  ),
                ),
                const Divider(
                  indent: 8,
                  endIndent: 8,
                  height: 1.0,
                  thickness: 0.2,
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        generateRandomShootings().toString(),
                        style: MatchTextStyle.statistics,
                      ),
                      const Spacer(),
                      Text(
                        'Shootings, %',
                        style: MatchTextStyle.subtitle,
                      ),
                      Spacer(),
                      Text(
                        generateRandomShootings().toString(),
                        style: MatchTextStyle.statistics,
                      )
                    ],
                  ),
                ),
                const Divider(
                  indent: 8,
                  endIndent: 8,
                  height: 1.0,
                  thickness: 0.2,
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        generateRandomStatistics().toString(),
                        style: MatchTextStyle.statistics,
                      ),
                      const Spacer(),
                      Text(
                        'Statistics, %',
                        style: MatchTextStyle.subtitle,
                      ),
                      const Spacer(),
                      Text(
                        generateRandomStatistics().toString(),
                        style: MatchTextStyle.statistics,
                      )
                    ],
                  ),
                ),
                const Divider(
                  indent: 8,
                  endIndent: 8,
                  height: 1.0,
                  thickness: 0.2,
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        generateRandomYellowCards().toString(),
                        style: MatchTextStyle.statistics,
                      ),
                      const Spacer(),
                      Text(
                        'Yellow cards',
                        style: MatchTextStyle.subtitle,
                      ),
                      const Spacer(),
                      Text(
                        generateRandomYellowCards().toString(),
                        style: MatchTextStyle.statistics,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTeamLogo(dynamic team) {
    try {
      if (team != null && team['crest'] != null) {
        return Image.network(
          team['crest'],
          height: 40,
          errorBuilder: (context, error, stackTrace) {
            return Container(width: 40, height: 40, color: Colors.grey);
          },
        );
      }
    } catch (e) {}
    return Container(width: 40, height: 40, color: Colors.grey);
  }

  int generateRandomYellowCards() {
    return Random().nextInt(15) + 3;
  }

  int generateRandomShootings() {
    return Random().nextInt(63) + 12;
  }

  int generateRandomPassings() {
    return Random().nextInt(146) + 35;
  }

  int generateRandomStatistics() {
    return Random().nextInt(92) + 7;
  }
}
