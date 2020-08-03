import 'package:shared_preferences/shared_preferences.dart';

class sharedPreferences{
    var pref;
    Future<void> open() async{
      pref=await SharedPreferences.getInstance();
      
    }
   void save(String key,String value) async{
     if(pref==null){
       await open();
     }
       pref.setString(key, value);
      
    }
   Future<String> read(String key,dynamic def) async{
    if(pref==null){
       await open();
     }
     
     return pref.getString(key)??def;
  }
  void remove(String key) {
    pref.remove(key);
  }
}