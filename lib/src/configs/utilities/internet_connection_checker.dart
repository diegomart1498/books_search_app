part of 'package.dart';

class InternetConnectionChecker {
  static Future<bool> hasConnection() async {
    try {
      return await InternetConnection().hasInternetAccess;
    } catch (error) {
      logge('There is not internet connection');
      toast(error.toString());
    }
    return false;
  }
}
