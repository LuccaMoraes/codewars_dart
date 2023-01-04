import 'dart:io';
import 'challenge06-screen_locking_patterns.dart';


void main (){

  var file = File('F:/New folder/Lucas/Coding BootCamp/Dart/Codewars/challenge06-AllValidPerms.txt');
  var sink = file.openWrite();
  sink.write(validPerms());

  // Close the IOSink to free system resources.
  sink.close();

}

Set <String> validPerms(){
  Set <String> ans = {};
  int len = findAllValidPerms().length;
  List <String> lst = findAllValidPerms().toList();
  //findAllValidPerms('abcdefghi').forEach((element) {ans.add("'$element'");});
  
  for(int i = 0; i <len;i++){
    ans.add("'${lst[i]}'");
    if(i%5 == 0){

      ans.add(String.fromCharCode(244));
    }

  }

  return ans;
}