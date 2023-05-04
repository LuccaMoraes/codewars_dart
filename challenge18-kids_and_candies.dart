void main() {
  /// kata from: https://www.codewars.com/kata/56cca888a9d0f25985000036/train
  ///
  /// What to do: return the minimum common multiple of the factor of kids
  ///
  // test();
}

int candiesToBuy(kidsInvited) {
  int fact = factorial(kidsInvited);
  return 0;
}

int factorial(int n) {
  int fact = n;

  while (n > 1) {
    n--;
    fact *= n;
  }

  return fact;
}

void test() {
  print(candiesToBuy(1) == 1);
  print(candiesToBuy(2) == 2);
  print(candiesToBuy(3) == 6);
  print(candiesToBuy(4) == 12);
  print(candiesToBuy(5) == 60);
  //print(candiesToBuy(10) == 2520);
  //print(candiesToBuy(11) == 27720);
  //print(candiesToBuy(12) == 27720);
  //print(candiesToBuy(20) == 232792560);
}
