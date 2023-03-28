void main() {
/*

It's a recursive function that evaluates mathematical expressions containing the
basic arithmetic operators, parentheses, and decimal numbers.

The function parentheses takes a string s as input and checks if there are any 
parentheses in it. If there are no parentheses, it calls the function 
addSub(multDiv(s)) which evaluates the expression without parentheses. If there
are parentheses, it loops through the string character by character and builds a
new string tempS that replaces the content between each pair of parentheses with
its result obtained by calling addSub(multDiv(betweenPar)) recursively. It then
continues to the next pair of parentheses until there are no more left.

The functions addSub and multDiv evaluate the expression by first cleaning up
the input string with the function cleaner. The cleaner function removes all
unnecessary and redundant characters from the input string and returns a list of
separated elements. The addSub function goes through the list and either adds or
subtracts the next value depending on the current operator. The multDiv function
goes through the list and executes all multiplications and divisions while
preserving all other symbols such as parentheses and/or sum/sub.

Finally, the function calc calls the parentheses function with the input string
s and returns the result as a number.



There are some ways the code could be refactored to improve readability and 
maintainability:

1. Instead of using a mix of num and String types throughout the code, it would
 be better to stick to one type consistently. In this case, it might be better 
 to use double throughout since the input and output are both floating-point 
 numbers.

2. It might be better to break the parentheses function into smaller, more
 focused functions that perform specific tasks. For example, one function to
 extract the innermost parentheses, another to evaluate a given expression, etc.
 This would make the code more modular and easier to test.

3. The cleaner function could be simplified by chaining multiple string
 transformations together using the replaceAll method. For example, instead of 
 chaining together multiple replaceAll calls, we could use one replaceAll call 
 with a regular expression to replace all unnecessary characters.

4. We could use double.tryParse instead of num.parse to avoid errors when
 parsing invalid strings.



*/
  String str = "abcde";

  //print(str);
  //print(parentheses(str));
  //print(calc(str));

  test();
  //print(str);
}

num calc(String s) => num.parse(parentheses(s));

String parentheses(String s) {
  // skips this function if no parentheses are found
  if (!s.contains('(')) return addSub(multDiv(s));

  // returns error if the amount of '(' and ')' is not the same
  if ('('.allMatches(s).length != ')'.allMatches(s).length) return 'invalid';

  // replaces all 'n(' with 'n*('
  s = multiplicationBeforeParentheses(s);

  // Locates the first math expr between () without any () within it
  String innermostExpr = RegExp(r'\([^\(\)]+\)').firstMatch(s)![0]!;

  // Removes the parentheses from both start and end, saving a clean expression
  innermostExpr = innermostExpr.substring(1, innermostExpr.length - 1);

  s = s.replaceAll('($innermostExpr)', addSub(multDiv(innermostExpr)));
  if (s.contains('(')) {
    s = parentheses(s);
  }

  return addSub(multDiv(s));
}

String multiplicationBeforeParentheses(String s) {
  // replaces all '(' preceded with a digit with '*('
  if (s.contains(RegExp(r'\d\('))) {
    final int temp = s.indexOf(RegExp(r'\d\(')) + 1;
    s = s.replaceRange(temp, temp + 1, '*(');

    // recursively replaces all 'n(' with 'n*(' if necessary
    if (s.contains(RegExp(r'\d\('))) {
      s = multiplicationBeforeParentheses(s);
    }
  }

  return s;
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
    if ('${codewarsSolution(ls[0])}' == '${ls[1]}') {
      print('testing for ${ls[0]} - \x1B[32mPASS\x1B[0m');
    } else {
      print('testing for ${ls[0]} - \x1B[31mFAILED\x1B[0m');
      print('expected ${ls[1]} - got ${codewarsSolution(ls[0])}');
    }
  }
}

codewarsSolution(String expression) {
  expression = expression.replaceAll(" ", "");
  while (expression.contains("(")) {
    String sub = expression.substring(0, expression.indexOf(")"));
    sub = sub.substring(sub.lastIndexOf("(") + 1);
    expression = expression.replaceAll("($sub)", '${engine(sub)}');
  }

  if (engine(expression) - engine(expression).toInt() == 0) {
    return engine(expression).toInt();
  }

  return engine(expression);
}

double engineOG(String str) {
  str = str.replaceAll("--", "+").replaceAll("+-", "-");
  str += "+";
  String number = str[0];
  String operator1 = "", operator2 = "";
  double number1 = 0, number2 = 0;

  for (int b = 1; b <= str.length; b++) {
    if (!"-+*/".contains(str[b])) {
      number += str[b];
    } else {
      double number3 = double.parse(number);

      if (operator2 == "") {
        number2 = number3;
      } else {
        operator2 == "*" ? number2 *= number3 : number2 /= number3;
      }

      if (str[b] == "+" || str[b] == "-") {
        if (operator1 == "") {
          number1 = number2;
        } else {
          operator1 == "+" ? number1 += number2 : number1 -= number2;
        }
        operator1 = str[b];
        operator2 = "";
      } else {
        operator2 = str[b];
      }
      b++;

      if (b < str.length) number = str[b];
    }
  }
  return number1;
}

double engine(String str) {
  // This function was commented by chatGPT
  // This function takes a mathematical expression as a String input and evaluates
  // it to a double-precision floating-point number.

  // Replace all instances of "--" with "+", and all instances of "+-" with "-".
  str = str.replaceAll("--", "+").replaceAll("+-", "-");

  // Append a "+" to the end of the string to ensure that the final number is
  //parsed correctly.
  str += "+";

  // Initialize some variables.
  String number = str[0]; // The first number in the expression.
  String operator1 = ""; // The first operator encountered in the expression.
  String operator2 = ""; // The second operator encountered in the expression.
  double number1 = 0; // The first number encountered in the expression.
  double number2 = 0; // The second number encountered in the expression.

  // Iterate through the input string character by character.
  for (int b = 1; b <= str.length; b++) {
    // If the current character is a digit or a decimal point, add it to the
    // "number" variable.
    if (!"-+*/".contains(str[b])) {
      number += str[b];
    }

    // If the current character is an operator, perform the appropriate operation.
    else {
      // Convert the "number" string variable to a double.
      double number3 = double.parse(number);

      // If "operator2" is empty, set "number2" to "number3".
      // Otherwise, perform the appropriate operation based on the value of "operator2".
      if (operator2 == "") {
        number2 = number3;
      } else {
        operator2 == "*" ? number2 *= number3 : number2 /= number3;
      }

      // If the current operator is "+" or "-", perform the appropriate operation.
      // Update "operator1" to the current operator and "operator2" to an empty string.
      if (str[b] == "+" || str[b] == "-") {
        if (operator1 == "") {
          number1 = number2;
        } else {
          operator1 == "+" ? number1 += number2 : number1 -= number2;
        }
        operator1 = str[b];
        operator2 = "";
      }

      // If the current operator is "*" or "/", set "operator2" to the current
      // operator and skip the next character.
      else {
        operator2 = str[b];
      }
      b++;

      // If the next character is not an operator, start a new "number"
      // variable with it.
      if (b < str.length) number = str[b];
    }
  }

  // Return the final value of "number1", which should be the result of the
  // expression evaluation.
  return number1;
}
