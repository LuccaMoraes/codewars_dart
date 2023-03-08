void main() {
/*
  https://www.codewars.com/kata/52a78825cdfc2cfc87000005/train/dart

  Evaluate mathematical expression

  2kyu !!!!!!!!!!!

  Multiplication *
  Division / (as floating point division)
  Addition +
  Subtraction -
  
  Must support multiple levels of nested parentheses
  (2 / (2 + 3.33) * 4) - -6


  characters: 0-9 *-+/() 



  Steps to solution:
  1. Create a cleaner function: DONE
    "2 - - 6" => "2 + 6"
  2. Create a function that can resolve a simple +- imput: DONE
    "45 + 2" => 47
  3. Create a function that can resolve a simple *+-/ imput: DONE
    "2 + 35 * 9 - 100 / 2" => 267
  4. Create a function that support parentheses: DONE
    "2 * (5 + 2)" => 14
  5. Create a function that support nested parentheses:
    "2 * (5 + (1+1)-1) - (-5*2)" = 22
    "0+(2 / (2 + 3.33) * 4) - -6" = 7,500938086
    "(((10)))" = 10

*/
  String str = "6/2*(1+(2))";
//print(str);
//print(parentheses(str));
//print(calc(str));

//print(addSub('35 + 2'));

  test();
} //end main

num calc(String s) => num.parse(parentheses(s));

String parentheses(String s) {
  if (!s.contains('(')) return addSub(multDiv(s));
  int prths = 0;
  String tempS = '';

  for (int i = 0; i < s.length; i++) {
    if (s[i] == '(' || s[i] == ')') {
      if (s[i] == ')')
        prths--;
      else {
        prths++;
        if (i > 0 && isNum(s[i - 1])) tempS += '*';
      }
    }
    tempS += s[i];
  }

  if (prths != 0) return 'invalid';

  s = tempS;

  int lastOpenPar = s.lastIndexOf('(') + 1;
  int firstClosePar = s.substring(lastOpenPar).indexOf(')');
  String betweenPar = s.substring(lastOpenPar, firstClosePar + lastOpenPar);

  s = s.replaceAll('($betweenPar)', '${addSub(multDiv(betweenPar))}');
  if (s.contains('(')) {
    s = parentheses(s);
  }

  return addSub(multDiv(s));
}

bool isNum(String s) => '0123456789'.contains(s);

String addSub(String expression) {
  //goes through a string and either adds or subtracts the next value
  //returns the sum of all operations
  List expr = cleaner(expression);
  num result = 0;

  for (int i = 0; i < expr.length; i++) {
    if (expr[i] == '+') {
      result += num.parse(expr[i + 1]);
    } else if (expr[i] == '-') {
      result -= num.parse(expr[i + 1]);
    } else if (i == 0) {
      result += num.parse(expr[i]);
    }
  }

  return result.toString();
}

String multDiv(String s) {
  //goes through a string and executes all multiplications and divisions within it
  //while preserving all other symbols such as parentheses and/or sum/sub
  List expr = cleaner(s);
  List result = [];

  for (int i = 0; i < expr.length; i++) {
    if (expr[i] == '*' || expr[i] == '/') {
      num tempNum = expr[i + 1] == '-'
          ? num.parse(expr[i + 2]) * -1
          : num.parse(expr[i + 1]);

      if (expr[i] == '/') {
        result.last = (num.parse(result.last) / tempNum).toString();

        if (num.parse(result.last) - num.parse(result.last).toInt() == 0) {
          result.last = num.parse(result.last).toInt().toString();
        }
      } else {
        result.last = (num.parse(result.last) * tempNum).toString();
      }
      expr[i + 1] == '-' ? i += 2 : i++;
    } else {
      result.add(expr[i]);
    }
  }
  return result.join(' ');
}

List cleaner(String s) {
  //removes all unecessary and/or redundant characters in string
  //returns a list with all separated elements
  s[0] == '(' ? s = '0+' + s : s;
  s = s
      .replaceAll(' ', '')
      .replaceAll('()', '')
      .replaceAll('--', '+')
      .replaceAll('-+ ', '-')
      .replaceAll('+-', '-')
      .split('')
      .map((e) => e = '0123456789.'.contains(e) ? e : ' ${e} ')
      .join();

  return s.replaceAll('  ', ' ').trim().split(' ');
}

void test() {
  var tests = [
    ["(81)", 81],
    ['12*(25+1)', 312],
    ['2(1+2)', 6],
    ["1 + 1", 2],
    ["8/16", 0.5],
    ["3 -(-1)", 4],
    ["2 + -2", 0],
    ["10- 2- -5", 13],
    ["(((10)))", 10],
    ["3 * 5", 15],
    ["-7 * -(6 / 3)", 14],
    ['50+2*3', 56],
    ['(50+2)*3', 156],
    ['.5*3', 1.5],
    ['3*.5', 1.5],
  ];

  for (List ls in tests) {
    if ('${calc(ls[0])}' == '${ls[1]}') {
      print('testing for ${ls[0]} - \x1B[32mPASS\x1B[0m');
    } else {
      print('testing for ${ls[0]} - \x1B[31mFAILED\x1B[0m');
      print('expected ${ls[1]} - got ${calc(ls[0])}');
    }
  }
}
