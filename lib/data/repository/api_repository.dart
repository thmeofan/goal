import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiRepository {
  final String apiToken = '50d56084aec94a97a5bd24007f935234';

  Future<List<dynamic>> fetchMatches() async {
    final response = await http.get(
      Uri.parse('http://api.football-data.org/v4/matches'),
      headers: {'X-Auth-Token': apiToken},
    );

    if (response.statusCode == 200) {
      final result = json.decode(response.body);

      List<dynamic> matchesWithValidCrests = result['matches']
              ?.where((match) =>
                  match['status'] == 'FINISHED' &&
                  match['homeTeam'] != null &&
                  match['homeTeam']['crest'] != null &&
                  match['awayTeam'] != null &&
                  match['awayTeam']['crest'] != null &&
                  !isFluminenseFC(match))
              .toList() ??
          [];

      return matchesWithValidCrests;
    } else {
      throw Exception('Failed to load matches. Try entering the screen again');
    }
  }

  bool isFluminenseFC(dynamic match) {
    return match['homeTeam']['name'] == 'Fluminense FC' ||
        match['awayTeam']['name'] == 'Fluminense FC';
  }
}
