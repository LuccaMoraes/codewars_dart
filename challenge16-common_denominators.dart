void main(){

  //https://www.codewars.com/kata/54d7660d2daf68c619000d95/train/dart

  //tester();
  
  //var lst = [ [2, 4], [1, 3], [1, 4] ];
  //convertFrac(lst);

    /*
     n1/d1    n2/d2   n3/d3
  [ [2 , 4], [1, 3], [1, 4] ];
  d1*d2*d3 = 48 = mult
  n1*(mult/d1) = 24
  24/48 = 2/4
  n2*(mult/d2) = 16
  16/48 = 1/3
  n3*(mult/d3) = 12
  12/48 = 1/4
  
  localizar MDC(48,24,16,12) = 4
  
  24/48, 16/48, 12/48
  /4
  6/12, 4/12, 3/12
  
  */

}

// Some fractions need to be simplified
String convertFrac(lst) {
  List<List<int>> reducedNumLst = [];

  for(List<int> fraction in lst){
    reducedNumLst.add(reducedFraction(fraction));
  }


  
  return replaced('');

}

List<int> reducedFraction(List<int> fraction){
  int a = fraction[0];
  int b = fraction[1];

  while(b!=0){
    int temp = b;
    b = a % b;
    a = temp;
  }
  int gcd = a;

  return [fraction[0]~/gcd,fraction[1]~/gcd];
}

String replaced(String s){
  return s.replaceAll('[', '(')
      .replaceAll(']', ')')
      .replaceAll(' ', '')
      .replaceAll('),(', ')(')
      .replaceAll('((', '(')
      .replaceAll('))', ')');
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
  lst = [ [2, 2], [3, 1], [4, 1], [5, 1] ];
  dotest(lst, "(1,1)(3,1)(4,1)(5,1)");
  lst = [[5, 17], [5, 24], [10, 32], [50, 240], [5, 10], [100, 480]]; //timeout
  dotest(lst, "(240,816)(170,816)(255,816)(170,816)(408,816)(170,816)");
  lst = [[87, 181], [87, 106], [174, 524], [870, 1060], [87, 174], [1740, 2120]]; //timeout
  dotest(lst, "(1208082,2513366)(2062857,2513366)(834591,2513366)(2062857,2513366)(1256683,2513366)(2062857,2513366)");
}

void dotest(List lst, String ans){
  
  if(convertFrac(lst) == ans){
    print('$lst = \x1B[32mPASS\x1B[0m');
  }else{
    print('$lst = \x1B[31mFAILED!\x1B[0m');
    print('expected $ans');
    print('got ${convertFrac(lst)}');
    print('');
  }
}