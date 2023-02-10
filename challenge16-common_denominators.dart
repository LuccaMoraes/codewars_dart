void main(){

  //https://www.codewars.com/kata/54d7660d2daf68c619000d95/train/dart

  tester();

}

// Some fractions need to be simplified
String convertFrac(lst) {
  // your code
  return "";
}

void tester(){

  var lst = [ [2, 4], [1, 3], [1, 4] ];
  dotest(lst, "(6,12)(4,12)(3,12)");
  lst = [ [69, 130], [87, 1310], [3, 4] ];
  dotest(lst, "(18078,34060)(2262,34060)(25545,34060)");
  lst = [ [77, 130], [84, 131], [3, 4] ];
  dotest(lst, "(20174,34060)(21840,34060)(25545,34060)");
  lst = [ [6, 13], [187, 1310], [31, 41] ];
  dotest(lst, "(322260,698230)(99671,698230)(527930,698230)");
  lst = [ [8, 15], [7, 111], [4, 25] ];
  dotest(lst, "(1480,2775)(175,2775)(444,2775)");
}

void dotest(List lst, String ans){
  
  if(convertFrac(lst) == ans){
    print('$lst = PASS');
  }else{
    print('$lst = FAILED!');
    print('expected $ans');
    print('got ${convertFrac(lst)}');
    print('');
  }
}