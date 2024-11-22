import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'truth_screen.dart';
import 'dare_screen.dart';
import 'would_you_rather_screen.dart';
import 'never_have_i_ever_screen.dart';
import 'liked_questions_provider.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final likedQuestionsProvider = Provider.of<LikedQuestionsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Truth Dare Game'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: ListView(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TruthScreen()),
                    );
                  },
                  child: Text('Truth'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DareScreen()),
                    );
                  },
                  child: Text('Dare'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WouldYouRatherScreen()),
                    );
                  },
                  child: Text('Would You Rather'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NeverHaveIEverScreen()),
                    );
                  },
                  child: Text('Never Have I Ever'),
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Liked Questions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 1,
            child: likedQuestionsProvider.likedQuestions.isEmpty
                ? Center(
                    child: Text(
                      'No liked questions yet.',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                : ListView.builder(
                    itemCount: likedQuestionsProvider.likedQuestions.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 4.0),
                        child: Text(
                          '${index + 1}. ${likedQuestionsProvider.likedQuestions[index]}',
                          style: TextStyle(fontSize: 16),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
