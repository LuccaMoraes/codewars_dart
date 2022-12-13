import 'challenge06.dart';

void main(List<String> args) {

  /*
  Screen Locking Patterns
    _______
  | A B C |
  | D E F |
  | G H I |
    -------
  
  N# of passwords with lenght 'x':

  [4] = 1624
  [5] = 7152
  [6] = 26016
  [7] = 72912
  [8] = 140704
  [9] = 140704
  
   */



  testValidPerms();
  testNumberOfPermsPerLength();



}


int allPasswordsLen (int maxLen){
  Set <String> allPerms = findAllValidPerms();
  Set <String> n_validPerms = {};

  allPerms.forEach((element) {
    n_validPerms.add(element.substring(0,maxLen));
  });

  return n_validPerms.length;
}


List <String> findAllPerms(String source) {

  List <String> allPerms= [];
  
  void permutate(List list, int cursor) {

    // when the cursor gets this far, we've found one permutation, so save it
    if (cursor == list.length) {
      
      //if this is a valid permutation, save it
      allPerms.add(list.join());
      return;
    }

    for (int i = cursor; i < list.length; i++) {
      List permutation = new List.from(list);
      permutation[cursor] = list[i];
      permutation[i] = list[cursor];
      permutate(permutation, cursor + 1);
    }
  }

  permutate(source.split(''), 0);

  return allPerms;
}


List <String> findAllInvalidPerms(String source) {

  List <String> allValidPerms= [];
  
  void permutate(List list, int cursor) {

    // when the cursor gets this far, we've found one permutation, so save it
    if (cursor == list.length && isPermValid(list.join().split('')) == false) {
      
      //if this is a valid permutation, save it
      allValidPerms.add(list.join());
      return;
    }

    for (int i = cursor; i < list.length; i++) {
      List permutation = new List.from(list);
      permutation[cursor] = list[i];
      permutation[i] = list[cursor];
      permutate(permutation, cursor + 1);
    }
  }

  permutate(source.split(''), 0);

  return allValidPerms;
}


void testValidPerms(){
    Map<String, bool> validPermsTest = {
    'abcd': true,
    'acdb': false,
    'dbfhe': true,
    'dbihe': true,
    'gbidchafe': true,
    'abcdefghi': true,
    'abcfedghi': true,
    'dbfheciga': true,
    'acig': false,
    'ebfhdacig': true,
    'bcaedfhig': true,
    'dagebhfic': true,
    'efdaicgbh': true,
    'abiedgchf': true,
    'aedfhgicb': true,
    'aedfhgic': true,
    'aedfhgi': true,
    'aedfhg': true,
    'aedfh': true,
    'aedf': true,
    'aed': true,
    'begchai': true,
  };

  validPermsTest.forEach((key, value) {
    print(value == isPermValid(key.split(''))
        ? "test for ${key} -> ${String.fromCharCode(9)}ok"
        : "test for ${key} -> ${String.fromCharCode(9)}FAILED");
  });
}

void testNumberOfPermsPerLength(){

  int sumOfAllPerms = 0;
  Map<int, int> nPerms = {
    4: 1624,
    5: 7152,
    6: 26016,
    7: 72912,
    8: 140704,
    9: 140704,
  };

  for (int i = 4; i <= 9; i++) {
    allPasswordsLen(i) == nPerms[i]
        ? print('${allPasswordsLen(i)} pass')
        : print("${allPasswordsLen(i)} should be ${nPerms[i]}");

    sumOfAllPerms += allPasswordsLen(i);
  }
  print("sumOfAllPerms: $sumOfAllPerms");

}

void testCountPatterns(){
  print("'a', 0"+ String.fromCharCode(9) + (countPatternsFrom('a', 0) == 0? "ok": 'FAILED'));
  print("'a', 10"+ String.fromCharCode(9) + (countPatternsFrom('a', 10) == 0? "ok": 'FAILED'));
  print("'b', 1"+ String.fromCharCode(9) + (countPatternsFrom('b', 1) == 1? "ok": 'FAILED'));
  print("'c', 2"+ String.fromCharCode(9) + (countPatternsFrom('c', 2) == 5? "ok": 'FAILED'));
  print("'d', 3"+ String.fromCharCode(9) + (countPatternsFrom('d', 3) == 37? "ok": 'FAILED'));
  print("'e', 4"+ String.fromCharCode(9) + (countPatternsFrom('e', 4) == 256? "ok": 'FAILED'));
  print("'e', 8"+ String.fromCharCode(9) + (countPatternsFrom('e', 8) == 23280? "ok": 'FAILED'));
  
}

void runAllTests(){
  Stopwatch s = new Stopwatch();
  s.start();
  //testValidPerms();
  //testNumberOfPermsPerLength();
  testCountPatterns();
  s.stop();
  print("${s.elapsedMilliseconds} miliseconds");
}




