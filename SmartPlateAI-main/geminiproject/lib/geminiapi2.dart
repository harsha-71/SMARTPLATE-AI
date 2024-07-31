
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiAPI {
  static Future<List<String>> getGeminiData(List<String> ingredients) async {
    try {
      String apiKey = ''; // Put your API key here
      final header = await getHeader();

      final Map<String, dynamic> requestBody = {
        'contents': ingredients
            .map((ingredient) => {
          'parts': [
            {'text': 'Recipe with $ingredient'}
          ]
        })
            .toList(),
        'generationConfig': {
          'temperature': 0.8,
          'maxOutputTokens': 1000,
        }
      };

      String url =
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=$apiKey';

      var response = await http.post(
        Uri.parse(url),
        headers: header,
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
        return jsonResponse['candidates']
            .map<String>((candidate) =>
            candidate['content']['parts'][0]['text'].toString())
            .toList();
      } else {
        return [];
      }
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }

  static Future<Map<String, String>> getHeader() async {
    return {
      'Content-Type': 'application/json',
    };
  }
}
