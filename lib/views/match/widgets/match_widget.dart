import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:goal/consts/app_text_styles/match_text_style.dart';
import '../../../consts/app_colors.dart';
import '../views/statistics_screen.dart';

class MatchWidget extends StatelessWidget {
  final dynamic match;

  MatchWidget({required this.match});

  @override
  Widget build(BuildContext context) {
    if (match == null) {
      return Container();
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StatisticsScreen(match: match),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.whiteColor.withOpacity(0.08),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _buildTeamLogo(match['homeTeam']),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              match['homeTeam']?['name'] ?? 'Home Team',
                              style: MatchTextStyle.team,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${match['score']?['fullTime']?['home'] ?? ''} - ${match['score']?['fullTime']?['away'] ?? ''}', // Add null checks
                        style: MatchTextStyle.score,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _buildTeamLogo(match['awayTeam']),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              match['awayTeam']?['name'] ?? 'Away Team',
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: MatchTextStyle.team,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.whiteColor.withOpacity(0.08),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    'Game stats',
                    style: MatchTextStyle.button,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTeamLogo(dynamic team) {
    if (team != null && team['crest'] != null) {
      return Image.network(
        team['crest'],
        height: 40,
        errorBuilder: (context, error, stackTrace) {
          return Container(width: 40, height: 40, color: Colors.grey);
        },
      );
    } else {
      return Container(
        width: 40,
        height: 40,
        color: Colors.grey,
      );
    }
  }
}
