import 'dart:convert';

import 'package:http/http.dart' as http;

void main() async {
  await fetchRandomUsers();
}

Future<void> fetchRandomUsers() async {
  final url =
      Uri.parse('https://random-data-api.com/api/users/random_user?size=10');

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> users = jsonDecode(response.body);

      for (var user in users) {
        print('${user['uid']} - ${user['first_name']} ${user['last_name']}');
      }
    } else {
      print('Failed to load users. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error occurred: $e');
  }
}
