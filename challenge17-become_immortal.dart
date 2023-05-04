void main() {
  /// 1 kyu challenge from: https://www.codewars.com/kata/59568be9cc15b57637000054/dart

  print(elderAge(8, 5, 1, 100));

  test();
}

int elderAge(int m, int n, int l, int t) {
  List<List<int>> magicRectangle = newMagicRectangle(m, n);
  List<List<int>> afterLoss = donationLoss(magicRectangle, l);
  int sum = sumOfDonations(afterLoss);
  return sum % t;
}

int sumOfDonations(List<List<int>> rectangle) {
  int sum = 0;
  for (int i = 0; i < rectangle.length; i++) {
    for (int j = 0; j < rectangle[i].length; j++) {
      sum += rectangle[i][j];
    }
  }

  return sum;
}

List<List<int>> donationLoss(List<List<int>> magicRectangle, int l) {
  List<List<int>> afterLoss = [];

  for (int i = 0; i < magicRectangle.length; i++) {
    List<int> temp = [];

    for (int j = 0; j < magicRectangle[i].length; j++) {
      if (magicRectangle[i][j] - l <= 0) {
        temp.add(0);
      } else {
        temp.add(magicRectangle[i][j] - l);
      }
    }
    afterLoss.add(temp);
  }
  return afterLoss;
}

List<List<int>> newMagicRectangle(int m, int n) {
  List<List<int>> magicRectangle = [];

  for (int i = 0; i < n; i++) {
    List<int> tempRow = [];
    for (int j = 0; j < m; j++) {
      tempRow.add(i ^ j);
    }
    magicRectangle.add(tempRow);
  }
  return magicRectangle;
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
