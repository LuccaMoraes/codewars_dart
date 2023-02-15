void main() {
  List<int> a = [2, 4, 5, 6, 8, 10, 12];
  List<int> b = [1, 3, 5, 6];
  List<int> c = [2, 4, 5, 6, 8, 12];
  print(firstIntersection([a, b, c]));
}

int firstIntersection(List<List<int>> lst) {
  // orders the list from shortest to longest n of multiples
  lst.sort((a, b) => a.length.compareTo(b.length));

  // uses the shortest as the main pattern
  List<int> shortest = lst[0];

  // for each n in shortest, looks for it in every other list
  for (int n in shortest) {
    for (List<int> listOfMultiples in lst) {
      // if a list doesnt contain n, skips the loop to next n
      if (listOfMultiples.contains(n) == false) {
        break;
      } else {
        // if the loop manages to reach the end with the same n, returns n
        if (lst.last == listOfMultiples && listOfMultiples.contains(n)) {
          return n;
        }
      }
    }
  }
  return 1;
}
