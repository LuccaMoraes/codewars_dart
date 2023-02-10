void main(){

  //https://www.codewars.com/kata/54d7660d2daf68c619000d95/train/dart

  //tester();
  //print(great_common_divisor([48,24,16,12]));
  print(great_common_divisor([18078,34060,2262,34060,25545,34060]));

  var lst = [ [2, 4], [1, 3], [1, 4] ];
  //convertFrac(lst);

}

// Some fractions need to be simplified
String convertFrac(lst) {
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

  List <int> numerators = [];
  int denominatorsProduct = 1;

  for(List<int> fraction in lst){
    denominatorsProduct = denominatorsProduct*fraction[1];
  }

  for(int i = 0; i<lst.length; i++){
    numerators.add(lst[i][0]*(denominatorsProduct/lst[i][1]).floor());
  }

  List <int> allNumbers = numerators;
  allNumbers.add(denominatorsProduct);

  int gcd = great_common_divisor(allNumbers);

  List <int> allNumbersReduced = [];
  for(int n in allNumbers){
    allNumbersReduced.add((n/gcd).floor());
  }

  final int d = allNumbersReduced.last;
  allNumbersReduced.removeLast();

  final List ans = [];
  for(int n in allNumbersReduced){
    ans.add([n,d]);
  }

  //print(ans);
  
  return "$ans"
  .replaceAll(' ', '')
  .replaceAll('],[', ')(')
  .replaceAll('[', '(')
  .replaceAll(']', ')')
  .replaceAll('((', '(')
  .replaceAll('))', ')');

}

int great_common_divisor(List<int> numlst) {
  // TODO: there might be a bug in this code, must test it further
  int smallestNumber = numlst[0];

  for (int n in numlst) {
    n < smallestNumber ? smallestNumber = n : null;
  }

  for (int i = 0; i < numlst.length; i++) {
    if (numlst[i] % smallestNumber != 0) {
      smallestNumber--;
      i = 0;
    }
  }

  return smallestNumber;
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