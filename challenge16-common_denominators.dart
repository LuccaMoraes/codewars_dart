void main(){

  //https://www.codewars.com/kata/54d7660d2daf68c619000d95/train/dart

  
  tester();
  

  //var test = [[37, 81], [37, 56], [74, 224], [370, 560], [37, 74], [111, 123]];
  //print(convertFrac(test));

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
String convertFrac(lst) {
  
  // creates a newlist with the simplified fractions
  List<List<int>> reducedNumLst = [];
  for (List<int> fraction in lst) {
    reducedNumLst.add(reducedFraction(fraction));
  }

  //creates a list of all denominators
  List<int> denominators = [];
  for (List<int> fraction in reducedNumLst) {
    denominators.add(fraction[1]);
  }

  //finds the lowest common multiple of all denominators

  int lcm = lcmOf(denominators);



  //creates a list with the fractions scaled to the same denominators
  List<List<int>> sameDenominatorFractions = [];
  for (List<int> fraction in reducedNumLst) {
    sameDenominatorFractions.add([fraction[0] * (lcm ~/ fraction[1]), lcm]);
  }

  return replaced('$sameDenominatorFractions');
}

int lcmOf(List<int> numlst) {

  numlst = numlst.toSet().toList(); // removes duplicates
  numlst.sort(); //orders list from smallest to largest number


  //rules out trivial cases
  for (int n in numlst) {
    if (numlst.last % n != 0) {
      break;
    } else {
      if (numlst.last % n == 0 && numlst.last == n) {
        return numlst.last;
      }
    }
  }

  //sets the limit for the multiplication
  int limit = 1;
  for (int n in numlst) {
    limit = limit * n;
  }

  //creates the list of lists of multiples
  List<List<int>> multiplesList = [];
  for (int n in numlst) {
    multiplesList.add(multiplesOf(n, numlst.last, limit));
  }
  
  //finds the common multiples between numbers
  /// alternative algorithm:
  /// orders the list from shortest to longest n of multiples
  /// uses the shortest as the main pattern
  /// for each n in shortest, looks for it in every other list
  /// if a list doesnt contain n, skips the loop to next n
  /// if the loop manages to reach the end with the same n, returns n
  Set<int> unique = multiplesList[0].toSet();
  for (List multiples in multiplesList) {
    var chrono = Stopwatch();
    chrono.start();

    unique = unique.intersection(multiples.toSet()); // TODO: this is extremely slow
    
    chrono.stop();
    print('${chrono.elapsedMilliseconds} ms');
  }
  

  //returns the smallest multiple
  return unique.toList()[0];
}

List<int> multiplesOf(int n, int largestInt, int limit) {
  
  int start = largestInt - (largestInt % n) + n;
  List<int> multiples = [start];
  
  while (multiples.last < limit) {
    multiples.add(multiples.last + n);
  }
  
  return multiples.sublist(1);
}

List<int> reducedFraction(List<int> fraction) {
  int a = fraction[0];
  int b = fraction[1];

  while (b != 0) {
    int temp = b;
    b = a % b;
    a = temp;
  }
  int gcd = a;

  return [fraction[0] ~/ gcd, fraction[1] ~/ gcd];
}

String replaced(String s) {
  return s
      .replaceAll('[', '(')
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
  lst = [[5, 17], [5, 24], [10, 32], [50, 240], [5, 10], [100, 480]];
  dotest(lst, "(240,816)(170,816)(255,816)(170,816)(408,816)(170,816)");
  lst = [[87, 181], [87, 106], [174, 524], [870, 1060], [87, 174], [1740, 2120]]; // 3s +
  dotest(lst, "(1208082,2513366)(2062857,2513366)(834591,2513366)(2062857,2513366)(1256683,2513366)(2062857,2513366)");
  lst = [[1, 100], [3, 1000], [1, 2500], [1, 20000]];
  dotest(lst, "(200,20000)(60,20000)(8,20000)(1,20000)");
  lst = [[37, 81], [37, 56], [74, 224], [370, 560], [37, 74], [111, 123]]; //6s +
  dotest(lst, "(169904,371952)(245754,371952)(122877,371952)(245754,371952)(185976,371952)(335664,371952)");

}

void dotest(List lst, String ans){

  var chrono = Stopwatch();
  chrono.start();
  
  if(convertFrac(lst) == ans){
    chrono.stop();
    String ms = '${chrono.elapsedMilliseconds}';
    print('testing for $lst = \x1B[32mPASS\x1B[0m in $ms ms');
  }else{
    chrono.stop();
    String ms = '${chrono.elapsedMilliseconds}';
    print('testing for $lst = \x1B[31mFAILED!\x1B[0m in $ms ms');
    print('expected $ans');
    print('got ${convertFrac(lst)}');
    print('');
  }
}

