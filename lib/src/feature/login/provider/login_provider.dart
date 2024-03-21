part of '../package.dart';

class LoginProvider extends ChangeNotifier {
  final SharedPreferences prefs;
  LoginProvider(this.prefs);

  Future<void> onLogin({
    required String email,
    required String password,
  }) async {
    toast('Bienvenido');
    await prefs.setString('email', email);
    await prefs.setString('password', password);
  }

  Future<void> onLogOut(BuildContext context) async {
    await prefs.clear();
    if (context.mounted) context.go(LoginPage.route);
  }
}
