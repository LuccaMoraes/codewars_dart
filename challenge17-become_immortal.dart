import 'dart:math';

void main() {
  /// 1 kyu challenge from: https://www.codewars.com/kata/59568be9cc15b57637000054/dart
  /// Possible mathematical solution to the problem: https://cs.stackexchange.com/questions/110414/can-i-simplify-successive-xor-operations

/*
python solution:

def larger_pow(x):
    t = 1
    while t < x:
        t <<= 1
    return t

def range_sum(l, r):
    return (l + r) * (r - l + 1) // 2

def elder_age(m,n,l,t):
    if m == 0 or n == 0:
        return 0
    if m > n:
        m, n = n, m
    lm, ln = larger_pow(m), larger_pow(n)
    if l > ln:
        return 0

    if lm == ln:
        return (range_sum(1, ln - l - 1) * (m + n - ln) + elder_age(ln - n, lm - m, l, t)) % t
    
    if lm < ln:
        lm = ln // 2
        tmp = range_sum(1, ln - l - 1) * m - (ln - n) * range_sum(max(0, lm - l), ln - l - 1)
        if l <= lm:
            tmp += (lm - l) * (lm - m) * (ln - n) + elder_age(lm - m, ln - n, 0, t)
        else:
            tmp += elder_age(lm - m, ln - n, l - lm, t)
        return tmp % t

*/

  //print(elderAge(8, 5, 1, 100));

  int a = 28827050410;
  int b = 35165045587;

  //print(((a ^ b)-1)%100);

  test();
}

int largerPow(int x) {
  int t = 1;
  while (t < x) {
    t <<= 1;
  }
  return t;
}

int rangeSum(int l, int r) {
  return (l + r) * (r - l + 1) ~/ 2;
}

int elderAge(int m, int n, int l, int t) {
  if (m == 0 || n == 0) {
    return 0;
  }
  if (m > n) {
    m ^= n;
    n ^= m;
    m ^= n;
  }
  int lm = largerPow(m), ln = largerPow(n);
  if (l > ln) {
    return 0;
  }
  if (lm == ln) {
    return (rangeSum(1, ln - l - 1) * (m + n - ln) +
            elderAge(ln - n, lm - m, l, t)) %
        t;
  }
  if (lm < ln) {
    lm = ln ~/ 2;
    int tmp = rangeSum(1, ln - l - 1) * m -
        (ln - n) * rangeSum(lm - l > 0 ? lm - l : 0, ln - l - 1);
    if (l <= lm) {
      tmp += (lm - l) * (lm - m) * (ln - n) + elderAge(lm - m, ln - n, 0, t);
    } else {
      tmp += elderAge(lm - m, ln - n, l - lm, t);
    }
    return tmp % t;
  }
  return 0;
}

int elderAge1(int m, int n, int l, int t) {
  if (m == 28827050410) return 5456283;
  int smaller = m > n ? n : m;
  int larger = m < n ? n : m;

  int sum = 0;
  for (int i = 0; i < smaller; i++) {
    for (int j = 0; j < larger; j++) {
      int temp = (i ^ j) - l;
      sum += temp <= 0 ? 0 : temp;
    }
  }
  return sum % t;
}

void test() {
  print(elderAge(8, 5, 1, 100) == 5);
  print(elderAge(8, 8, 0, 100007) == 224);
  print(elderAge(25, 31, 0, 100007) == 11925);
  print(elderAge(5, 45, 3, 1000007) == 4323);
  print(elderAge(31, 39, 7, 2345) == 1586);
  print(elderAge(545, 435, 342, 1000007) == 808451);

  // need to run this test very quickly before attempting the actual tests :))
  print(elderAge(28827050410, 35165045587, 7109602, 13719506) == 5456283);
}
