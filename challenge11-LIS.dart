/*
Challenge Idea from https://www.youtube.com/watch?v=aPQY__2H3tE

Find the length of the longest increasing subsequence:

Constraints: i1 < i2 < ... < in
*/

void main() {
  List<int> a = [3, 1, 8, 2, 5];
  int aResult = 3;

  List<int> b = [5, 2, 8, 6, 3, 6, 9, 5];
  int bResult = 4;

  print(lis(a) == aResult);
  print(lis(b) == bResult);

  print(lis(a));
  print(lis(b));
}

int lis(List<int> list) {
  //print(list);
  // Evaluates if the list is empty of length 1 and returns accordingly
  if (list.length <= 1) return list.length;

  int maxDepth = 0;

  /// Nested for loops
  /// First loop: keeps track of the starting number
  /// Second loop: keeps track of the next number
  for (int start = 0; start < list.length - 1; start++) {
    for (int target = 1; target < list.length; target++) {
      /// if the next number (target) is larger than the starting one, the
      /// function will recall itself in order to evaluate the depth of the
      /// sublist starting from the 'target' number.
      /// The depth returned +1 is compared to the max depth found so far. If
      /// larger than the current maxDepth, the value is replaced.
      if (list[start] < list[target]) {
        int depth = 1 + lis(list.sublist(target));
        depth > maxDepth ? maxDepth = depth : null;
      }

      /// if target isn't larger than start, the loop is skipped to the next target.
    }

    /// when finished comparing all possible combinations begining from 'start',
    /// the loop goes to the next iterarion with the next 'start'
  }

  return maxDepth;
}
