import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ChatGPTService {
  static const String _apiKey = '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'; // Replace with your actual API key
  static const String _apiUrl = 'https://api.openai.com/v1/chat/completions';

  Future<Map<String, dynamic>> analyzePlantImage(File imageFile) async {
    try {
      // Convert image to base64
      final bytes = await imageFile.readAsBytes();
      final base64Image = base64Encode(bytes);

      // Prepare the request body
      final requestBody = {
        'model': 'gpt-4o',
        'messages': [
          {
            'role': 'system',
            'content': [
              {
                'type': 'text',
                'text': 'You are an expert plant pathologist integrated into a plant monitoring app. When the user sends an image of a plant, analyze the image carefully to identify any diseases, deficiencies, or issues. Based on your analysis, respond only in the following strict JSON format:\n\n{\n  "plantName": "string",\n  "issue": "string",\n  "severity": "string",\n  "quickFix": "string",\n  "problemDetails": {\n    "issue": "string",\n    "effects": "string",\n    "causes": ["string"]\n  },\n  "solutions": {\n    "organic": ["string"],\n    "chemical": [\n      {\n        "name": "string",\n        "description": "string",\n        "price": "string"\n      }\n    ]\n  },\n  "prevention": {\n    "summer": "string",\n    "winter": "string"\n  },\n  "dosAndDonts": [\n    {\n      "text": "string",\n      "isDo": boolean\n    }\n  ]\n}\n\nImportant Rules:\n1) Do not provide any explanation, commentary, or output outside of the JSON format.\n2) Be concise but informative in each field.\n3) Use "Unknown" or an empty list [] for fields where data cannot be inferred from the image.\n4) If the image is healthy and no issue is found, respond with:\n{\n  "plantName": "string",\n  "issue": "None",\n  "severity": "None",\n  "quickFix": "None",\n  "problemDetails": {\n    "issue": "None",\n    "effects": "None",\n    "causes": []\n  },\n  "solutions": {\n    "organic": [],\n    "chemical": []\n  },\n  "prevention": {\n    "summer": "Maintain regular watering and inspect leaves weekly.",\n    "winter": "Avoid overwatering and keep away from cold drafts."\n  },\n  "dosAndDonts": []\n}\n\nOnly return a valid JSON response that the system can parse.'
              }
            ]
          },
          {
            'role': 'user',
            'content': [
              {
                'type': 'text',
                'text': 'Analyse this plant'
              },
              {
                'type': 'image_url',
                'image_url': {
                  'url': 'data:image/jpeg;base64,$base64Image'
                }
              }
            ]
          }
        ],
        'max_tokens': 1000
      };

      // Make the API request
      final response = await http.post(
        Uri.parse(_apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_apiKey',
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final content = responseData['choices'][0]['message']['content'];
        print('Content: $content');
        
        // Try to parse the content as JSON
        try {
          return jsonDecode(content);
        } catch (e) {
          // If parsing fails, return default data
          print('Failed to parse content as JSON, returning default data');
          return {
            'plantName': 'Unknown Plant',
            'issue': 'None',
            'severity': 'None',
            'quickFix': 'None',
            'problemDetails': {
              'issue': 'None',
              'effects': 'None',
              'causes': []
            },
            'solutions': {
              'organic': [],
              'chemical': []
            },
            'prevention': {
              'summer': 'Maintain regular watering and inspect leaves weekly.',
              'winter': 'Avoid overwatering and keep away from cold drafts.'
            },
            'dosAndDonts': []
          };
        }
      } else {
        // Print detailed error information
        final errorResponse = jsonDecode(response.body);
        print('API Error Response:');
        print('Status Code: ${response.statusCode}');
        print('Error Type: ${errorResponse['error']['type']}');
        print('Error Message: ${errorResponse['error']['message']}');
        print('Error Code: ${errorResponse['error']['code']}');
        print('Full Error Response: $errorResponse');
        
        throw Exception('API Error: ${errorResponse['error']['message']} (Code: ${errorResponse['error']['code']})');
      }
    } catch (e) {
      print('Error analyzing image:');
      print('Error Type: ${e.runtimeType}');
      print('Error Message: $e');
      print('Stack Trace: ${StackTrace.current}');
      throw e;
    }
  }
} 