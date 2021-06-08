import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pa_fjt_mobile/error/exception.dart';
import 'package:pa_fjt_mobile/main.dart';
import 'package:pa_fjt_mobile/models/request.dart';
import 'package:pa_fjt_mobile/services/authentication_api.dart';
import 'package:pa_fjt_mobile/services/base_service.dart';
import 'package:pa_fjt_mobile/utils/constant.dart';

class RequestService {
  final http.Client client = http.Client();

  static final RequestService _singleton = RequestService._internal();
  final UserService _userService = UserService();

  RequestService._internal();

  factory RequestService() {
    return _singleton;
  }

  Future<List<RequestEntity>> getRequests(String email) async {
    // revnoie une exception si l'utilisateur n'est pas connecté
    await ensureConnection();

    print("====== ${_userService.token}");
    final http.Response response = await client.get(
        Uri.parse("$FLATREQUESTHOST/flatRequest/getByEmail/$email"),
        headers: {
          'Content-Type': 'application/json',
          'authorization': (userService.token == null) ? '' : userService.token!
        });

    List<RequestEntity> results = <RequestEntity>[];
    if (response.statusCode == 200) {
      print(response.body);
      final List jsons = jsonDecode(response.body);
      jsons.forEach((element) {
        results.add(RequestEntity.fromJson(element as Map<String, dynamic>));
      });
      return results;
    } else if (response.statusCode == 403) {
      print(response.body);
      throw BadCredentialsException();
    } else {
      print(response.body);
      throw ServerException();
    }
  }
}
