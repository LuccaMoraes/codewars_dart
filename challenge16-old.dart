void main(){

  //https://www.codewars.com/kata/54d7660d2daf68c619000d95/train/dart

  //tester();
  //print(great_common_divisor([48,24,16,12]));
  //print(great_common_divisor([17,24,32,240,10,480]));
  //print(great_common_divisor([18078,34060,2262,34060,25545,34060,]));
  print(numReducer([4,8,12]));

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
  List<int> numerators = [];
  int denominatorsProduct = 1;
  final List ans = [];
  
  for (List<int> fraction in lst) {
    denominatorsProduct = denominatorsProduct * fraction[1];
  }

  for (int i = 0; i < lst.length; i++) {
    numerators.add(lst[i][0] * (denominatorsProduct / lst[i][1]).floor());
  }

  List<int> allNumbers = numerators;
  allNumbers.add(denominatorsProduct);

  int gcd = great_common_divisor(allNumbers);

  List<int> allNumbersReduced = [];
  for (int n in allNumbers) {
    allNumbersReduced.add((n / gcd).floor());
  }

  final int d = allNumbersReduced.last;
  allNumbersReduced.removeLast();

  
  for (int n in allNumbersReduced) {
    ans.add([n, d]);
  }

  //print(ans);
  

  return replaced('$ans');

}

String replaced(String s){
  return s.replaceAll('[', '(')
      .replaceAll(']', ')')
      .replaceAll(' ', '')
      .replaceAll('),(', ')(')
      .replaceAll('((', '(')
      .replaceAll('))', ')');
}



int great_common_divisor(List<int> numlst) {
  int smallestNumber = numlst[0];

  for (int n in numlst) {
    if(isPrime(n) && n != 2) return 1;
    n < smallestNumber ? smallestNumber = n : null;
  }

  for (int i = 0; i < numlst.length; i++) {
    if(isPrime(numlst[i]) && numlst[i] != 2) return 1;
    if (numlst[i] % smallestNumber != 0) {
      //TODO: this is extremely ineficient!
      //must find a way to find great common divisor exponentially faster
      smallestNumber--;
      i = -1;
    }
    print(smallestNumber);
  }

  return smallestNumber;
}

List<int> numReducer(List<int> numlst) {
  List<int> reducedNumbers = [];

  for(int i = 0, divisor = 2; i < numlst.length; i++){
    if(numlst[i]%divisor == 0){
      reducedNumbers.add((numlst[i]/divisor).round());
      divisor++;
      i = -1;
    }else{
      divisor++;
      i = -1;
    }
  }
  return reducedNumbers;
}

bool isPrime(n) {
  if (n == 2) return true;
  if (n % 2 == 0) return false;

  for (int i = 3; i < n; i++) {
    if (n % i == 0) return false;
  }

  return true;
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