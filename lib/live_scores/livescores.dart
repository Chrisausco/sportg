import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';



class LiveScoresScreen extends StatefulWidget {
  @override
  _LiveScoresScreenState createState() => _LiveScoresScreenState();
}

class _LiveScoresScreenState extends State<LiveScoresScreen> {
  // final String apiUrl =
  //  "2b82e840fb9d4803eab469e75405d88919631cb79b7fef567209cb1cc74db";
  final String apiKey = "5380d2be586b788c82c58f1cea527e98"; // Replace with your API key

  List liveMatches = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchLiveScores();
  }

  Future<void> fetchLiveScores() async {
    final String apiUrl = "https://api-football-v1.p.rapidapi.com/v3";
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
        "X-RapidAPI-Key": apiKey,
        "X-RapidAPI-Host": "api-football-v1.p.rapidapi.com",
      },

      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          liveMatches = data['response'];
          isLoading = false;
          print(jsonDecode(response.body));
        });
      } else {
        throw Exception("Failed to load live scores");
      }
    } catch (e) {
      print("Error: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Live Football Scores")),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : liveMatches.isEmpty
              ? Center(child: Text("No live matches currently."))
              : ListView.builder(
                  itemCount: liveMatches.length,
                  itemBuilder: (context, index) {
                    final match = liveMatches[index];
                    final homeTeam = match['teams']['home']['name'];
                    final awayTeam = match['teams']['away']['name'];
                    final homeLogo = match['teams']['home']['logo'];
                    final awayLogo = match['teams']['away']['logo'];
                    final homeScore = match['goals']['home'] ?? 0;
                    final awayScore = match['goals']['away'] ?? 0;
                    final league = match['league']['name'];
                    final elapsedTime = match['fixture']['status']['elapsed'];

                    return Card(
                      margin: EdgeInsets.all(10),
                      child: ListTile(
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("$elapsedTime'", style: TextStyle(color: Colors.red)),
                            Text(league, style: TextStyle(fontSize: 12)),
                          ],
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Image.network(homeLogo, width: 30, height: 30),
                                Text(homeTeam),
                              ],
                            ),
                            Text("$homeScore - $awayScore", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            Column(
                              children: [
                                Image.network(awayLogo, width: 30, height: 30),
                                Text(awayTeam),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}