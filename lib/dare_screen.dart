import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'liked_questions_provider.dart';

class DareScreen extends StatefulWidget {
  @override
  _DareScreenState createState() => _DareScreenState();
}

class _DareScreenState extends State<DareScreen> {
  String dareQuestion = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchDare();
  }

  Future<void> fetchDare() async {
    final url = Uri.parse('https://api.truthordarebot.xyz/v1/dare?rating=pg13'); // Dare API

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          dareQuestion = data['question'];
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        throw Exception('Failed to load dare question');
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dare Question'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    dareQuestion,
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add the current dare question to the liked questions
                    Provider.of<LikedQuestionsProvider>(context, listen: false)
                        .addLikedQuestion(dareQuestion);
                  },
                  child: Text('Like this Question'),
                ),
              ],
            ),
    );
  }
}
