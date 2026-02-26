import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseUrl = 'https://tapatupa.taputkab.go.id/api';
  static const String vendorId = '2kadMK7vwBQp9tDEd2OqvSxuPYimFQoK';

  // Get headers with authentication token
  static Future<Map<String, String>> _getHeaders(
      [bool requiresAuth = true]) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Vendor-ID': vendorId,
      'Accept': 'application/json',
    };

    if (requiresAuth) {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('accessToken');
      if (token == null) {
        throw Exception('No authentication token found. Please login again.');
      }
      headers['Authorization'] = 'Bearer $token';
    }

    return headers;
  }

  // Login method with complete error handling
  static Future<Map<String, dynamic>> login(
      String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login-mobile'),
        headers: await _getHeaders(false), // Don't require auth for login
        body: jsonEncode({
          'username': username,
          // 'email': email,
          'password': password,
        }),
      );

      print('Login Response Status: ${response.statusCode}');
      print('Login Response Body: ${response.body}');

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200 && responseData['responseCode'] == 200) {
        // Save user data
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('accessToken', responseData['accessToken'] ?? '');
        await prefs.setBool('isLoggedIn', true);

        if (responseData['userData'] != null &&
            responseData['userData'].isNotEmpty) {
          final userData = responseData['userData'][0];
          await prefs.setString('namaLengkap', userData['namaLengkap'] ?? '');
          await prefs.setInt('idPersonal', userData['idPersonal'] ?? 0);
          await prefs.setInt('roleId', userData['roleId'] ?? 0);
          print(
              'Saved user data: ${userData['namaLengkap']} - ${userData['idPersonal']}');
        }

        return responseData;
      } else {
        throw Exception(responseData['responseMessage'] ?? 'Login failed');
      }
    } catch (e) {
      print('Login Error: $e');
      throw Exception('Failed to connect to server: $e');
    }
  }

// Add method to check if user is logged in
  static Future<bool> isLoggedIn() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('accessToken');
      return token != null;
    } catch (e) {
      return false;
    }
  }

// Add method to check server connection
  static Future<bool> checkConnection() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/ping'),
        headers: {'Vendor-ID': vendorId},
      ).timeout(Duration(seconds: 5));

      return response.statusCode == 200;
    } catch (e) {
      print('Connection check failed: $e');
      return false;
    }
  }

  static Future<Map<String, dynamic>> get(String endpoint,
      {Map<String, String>? queryParams}) async {
    try {
      final uri = Uri.parse('$baseUrl/$endpoint').replace(
        queryParameters: {
          ...?queryParams,
          'vendor': vendorId,
        },
      );

      final response = await http.get(
        uri,
        headers: await _getHeaders(),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // POST method
  static Future<Map<String, dynamic>> post(
    String endpoint,
    Map<String, dynamic> body,
  ) async {
    try {
      final headers = await _getHeaders();
      final response = await http.post(
        Uri.parse('$baseUrl/$endpoint'),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 401) {
        await logout();
        throw Exception('Unauthorized: Session expired');
      }

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return responseData;
      } else {
        throw Exception(responseData['responseMessage'] ?? 'Request failed');
      }
    } catch (e) {
      throw Exception('POST request failed: ${e.toString()}');
    }
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static Future<Map<String, dynamic>> postWithFiles(
    String endpoint,
    Map<String, String> fields,
    List<Map<String, dynamic>> documents,
  ) async {
    try {
      final headers = await _getHeaders();
      var uri = Uri.parse('$baseUrl/$endpoint');
      var request = http.MultipartRequest('POST', uri);

      request.headers.addAll(headers);
      request.fields.addAll(fields);

      print('Uploading documents: ${documents.length}');

      for (var i = 0; i < documents.length; i++) {
        if (documents[i]['filePath'] != null &&
            documents[i]['filePath'].isNotEmpty) {
          try {
            request.files.add(await http.MultipartFile.fromPath(
              'fileDokumen[$i]',
              documents[i]['filePath'],
            ));
            request.fields['jenisDokumen[$i]'] = documents[i]['name'] ?? '';
            request.fields['keteranganDokumen[$i]'] =
                documents[i]['description'] ?? '';
            print('Added document $i: ${documents[i]['name']}');
          } catch (e) {
            print('Error adding file $i: $e');
          }
        }
      }

      print('Sending request to: $uri');
      print('Request fields: ${request.fields}');

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 401) {
        await logout();
        throw Exception('Unauthorized: Session expired');
      }

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return responseData;
      } else {
        throw Exception(responseData['responseMessage'] ?? 'Request failed');
      }
    } catch (e) {
      print('API Error: $e');
      throw e;
    }
  }

  static Future<Map<String, dynamic>> postMultipart(
    String endpoint,
    Map<String, String> fields,
    Map<String, String> files,
  ) async {
    var uri = Uri.parse('$baseUrl/$endpoint');
    var request = http.MultipartRequest('POST', uri);

    // Add headers
    final headers = await _getHeaders();
    request.headers.addAll(headers);

    // Add fields
    request.fields.addAll(fields);

    // Add files
    for (var entry in files.entries) {
      if (entry.value.isNotEmpty) {
        request.files.add(
          await http.MultipartFile.fromPath(entry.key, entry.value),
        );
      }
    }

    try {
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 401) {
        await logout();
        throw Exception('Unauthorized');
      }

      return json.decode(response.body);
    } catch (e) {
      throw Exception('Failed to submit form: $e');
    }
  }
}
