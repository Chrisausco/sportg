import 'package:flutter/material.dart';

class MatchDetailsPage extends StatelessWidget {
  final dynamic match;
  MatchDetailsPage(this.match);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Match Details")),
      body: Column(
        children: [
          Text(
            "${match['home_team']} vs ${match['away_team']}",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text("Score: ${match['home_score']} - ${match['away_score']}"),
          SizedBox(height: 20),
          TabBarViewWidget(match),
        ],
      ),
    );
  }
}

class TabBarViewWidget extends StatelessWidget {
  final dynamic match;
  TabBarViewWidget(this.match);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(text: "STAT"),
              Tab(text: "LINE UP"),
            ],
          ),
          Container(
            height: 200,
            child: TabBarView(
              children: [
                MatchStats(match),
                MatchLineUp(match),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MatchStats extends StatelessWidget {
  final dynamic match;
  MatchStats(this.match);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(title: Text("Possession: ${match['stats']['possession']}")),
        ListTile(title: Text("Shots on target: ${match['stats']['shots_on_target']}")),
        ListTile(title: Text("Corners: ${match['stats']['corners']}")),
      ],
    );
  }
}


class MatchLineUp extends StatelessWidget {
  final dynamic match;
  MatchLineUp(this.match);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text("Home Team Lineup", style: TextStyle(fontWeight: FontWeight.bold)),
        ...match['lineup']['home'].map((player) => ListTile(title: Text(player))).toList(),
        SizedBox(height: 10),
        Text("Away Team Lineup", style: TextStyle(fontWeight: FontWeight.bold)),
        ...match['lineup']['away'].map((player) => ListTile(title: Text(player))).toList(),
      ],
    );
  }
}

