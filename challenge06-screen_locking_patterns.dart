import 'challenge06-testSuite.dart';

void main() {
  /*
  https://www.codewars.com/kata/585894545a8a07255e0002f1

  3kyu!!!!!

  */

  runAllTests();
}

//findAllValidPerms is executed only once and all the tests and functions callouts are based on its result
final Set<String> allValidPerms = findAllValidPerms();
const abc = 'abcdefghi';

int countPatternsFrom(String f, int l) {
  //this sequence of if statements rules out trivial cases, therefore speeding up the process
  if (l <= 0 || l > 9 || abc.contains(f.toLowerCase()) == false) {return 0;}
  if (l == 1) {return 1;}
  if (l == 2) {
    if ('acgi'.contains(f.toLowerCase())) {return 5;}
    if ('bdfh'.contains(f.toLowerCase())) {return 7;}
    if (f == 'e') {return 8;}
  }

  Set<String> f_validPerms = {};

  allValidPerms.forEach((password) {
    if (password[0] == f.toLowerCase()) {
      //this will fill the new set with only the passwords that the required starting character and length
      f_validPerms.add(password.substring(0, l));
    }
  });
  return f_validPerms.length;
}

//Goes through each character in a possible permutation and evaluates if given combination is valid
bool isPermValid(List<String> s) {
  bool a = true,b = true,c = true,d = true,e = true,f = true,g = true,h = true,i = true;
  String usedChars = '';

  for (int l = 0; l < s.length; l++) {
    //possible patterns for each letter
    //true = path is valid / false = path is NOT valid
    List<bool> listA = [false,b,usedChars.contains('b'),d,e,f,usedChars.contains('d'),h,usedChars.contains('e')];
    List<bool> listB = [a, false, c, d, e, f, g, usedChars.contains('e'), i];
    List<bool> listC = [usedChars.contains('b'),b,false,d,e,f,usedChars.contains('e'),h,usedChars.contains('f')];
    List<bool> listD = [a, b, c, false, e, usedChars.contains('e'), g, h, i];
    List<bool> listE = [a, b, c, d, false, f, g, h, i];
    List<bool> listF = [a, b, c, usedChars.contains('e'), e, false, g, h, i];
    List<bool> listG = [usedChars.contains('d'),b,usedChars.contains('e'),d,e,f,false,h,usedChars.contains('h')];
    List<bool> listH = [a, usedChars.contains('e'), c, d, e, f, g, false, i];
    List<bool> listI = [usedChars.contains('e'),b,usedChars.contains('f'),d,e,f,usedChars.contains('h'),h,false];

    List<List> possibilities = [listA,listB,listC,listD,listE,listF,listG,listH,listI];

    int prevChar = abc.indexOf(l - 1 < 0 ? '' : s[l - 1]);
    String char = s[l];

    if (l - 1 >= 0) {
      //evaluates the validity of the path between two chars according to the list of possibilities
      if (possibilities[prevChar][abc.indexOf(char)] == false) {
        return false;
      }
    }
    usedChars += char;
  }
  return true;
}

Set<String> findAllValidPerms() {
  Set<String> allValidPerms = {};

  void permutate(List lst, int pointer) {
    //when the pointer is equal to lst.length, a permutation was found
    if (pointer == lst.length && isPermValid(lst.join().split(''))) {
      //if this is a valid permutation, save it
      allValidPerms.add(lst.join());
      return;
    }

    for (int i = pointer; i < lst.length; i++) {
      List permutation = List.from(lst);
      permutation[pointer] = lst[i];
      permutation[i] = lst[pointer];
      permutate(permutation, pointer + 1);
    }
  }

  permutate(abc.split(''), 0);

  return allValidPerms;
}
