import 'package:pa_fjt_mobile/error/exception.dart';
import 'package:pa_fjt_mobile/models/user.dart';
import 'package:pa_fjt_mobile/services/authentication_api.dart';

/// assure que l'utilisateur connecté est bien chargé dans le singleton UserService
/// si ce n'est pas le cas, on utilise l'utilisateur sauvegardé dans les SharedPreferences pour se connecter et générer un token
/// si aucun utilisateur n'est présent dans les SharedPreferences alors une exception est générée.
Future ensureConnection() async {
  final UserService userService = UserService();
  if (!userService.isAuthenticated || userService.token == null) {
    User? user = await userService.getSavedUser();
    if (user != null) {
      userService.loginUser(user.email, user.password);
    }
  }
  if (!userService.isAuthenticated) {
    throw Exception('user is not connected');
  }
}
