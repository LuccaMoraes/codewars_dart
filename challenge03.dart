void main(){
  /*
  https://www.codewars.com/kata/5277c8a221e209d3f6000b56/train/dart
  
  Valid Braces

  "(){}[]"   =>  True
  "([{}])"   =>  True
  "(}"       =>  False
  "[(])"     =>  False
  "[({})](]" =>  False
  
  
   */

  print(validBraces("([{}])"));
}

bool validBraces(String braces) {

  String str = braces;

  while(str.contains("{}") || str.contains("()") || str.contains("[]")){
    str = str
      .replaceAll("{}", "")
      .replaceAll("[]", "")
      .replaceAll("()", "");
  }
  print(str);

 return str == "";
}