void main() {
  /// 1 kyu challenge from: https://www.codewars.com/kata/59568be9cc15b57637000054/dart

  //print(elderAge(8, 5, 1, 100));

  int a = 28827050410;
  int b = 35165045587;

  //print(((a ^ b)-1)%100);

  //newMagicRectangle(100000, 10000);

  test();
}

int elderAge(int m, int n, int l, int t) {
  int sum = 0;
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < m; j++) {
      int temp = (i ^ j)-l;
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
  // print(elderAge(28827050410, 35165045587, 7109602, 13719506) == 5456283);
}
