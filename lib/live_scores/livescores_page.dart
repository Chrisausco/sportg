import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'match_details_page.dart';

class LiveScoresPage extends StatefulWidget {
  @override
  _LiveScoresPageState createState() => _LiveScoresPageState();
}

class _LiveScoresPageState extends State<LiveScoresPage> {
  List<dynamic> matches = [];

  @override
  void initState() {
    super.initState();
    fetchLiveScores();
  }

  Future<void> fetchLiveScores() async {
    final response = await http.get(Uri.parse("YOUR_API_URL_HERE"));
    if (response.statusCode == 200) {
      setState(() {
        matches = json.decode(response.body)["matches"];
      });
    } else {
      throw Exception("Failed to load scores");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Football Live Scores")),
      body: matches.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: matches.length,
              itemBuilder: (context, index) {
                final match = matches[index];
                return MatchCard(match);
              },
            ),
    );
  }
}

class MatchCard extends StatelessWidget {
  final dynamic match;
  MatchCard(this.match);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text("${match['home_team']} vs ${match['away_team']}"),
        subtitle: Text("Score: ${match['home_score']} - ${match['away_score']}"),
        trailing: IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MatchDetailsPage(match)),
            );
          },
        ),
      ),
    );
  }
}