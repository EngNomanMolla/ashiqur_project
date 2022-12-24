import 'package:food_app/session/key_text.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefab {
  static SharedPreferences? prefab;

  Future InitSharedPrefab() async {
    prefab = await SharedPreferences.getInstance();
  }

  

  Future setEmailOrPhone(String value) async {
    await prefab!.setString(ConstanceData.Email_Or_Phone, value);
  }

  getEmailOrPhone() {
    return prefab!.get(ConstanceData.Email_Or_Phone);
  }

  Future setPassword(String value) async {
    await prefab!.setString(ConstanceData.Password, value);
  }

  getPassword() {
    return prefab!.get(ConstanceData.Password);
  }

  Future setRemember(bool value) async {
    await prefab!.setBool(ConstanceData.Remember_Me, value);
  }

  getRemember() {
    return prefab!.get(ConstanceData.Remember_Me);
  }

  Future setName(String value) async {
    await prefab!.setString(ConstanceData.Name, value);
  }

  getName() {
   return prefab!.get(ConstanceData.Name);
  }

  Future setAuthToken(bool value) async {
    await prefab!.setBool(ConstanceData.Token, value);
  }

  getAuthToken() {
   return prefab!.get(ConstanceData.Token);
  }
}
