import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ChatGPTService {
  final String _endpoint = 'https://plantapp-backend-ucyh.onrender.com/analyze-plant';

  Future<Map<String, dynamic>> analyzePlantImage(File imageFile) async {
    try {
      final uri = Uri.parse(_endpoint);

      final request = http.MultipartRequest('POST', uri)
        ..files.add(await http.MultipartFile.fromPath('file', imageFile.path));

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data as Map<String, dynamic>;
      } else {
        print('Error response: ${response.statusCode}');
        throw Exception('Failed to analyze image');
      }
    } catch (e) {
      print('Exception during image analysis: $e');
      rethrow;
    }
  }
}
