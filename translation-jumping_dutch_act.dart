void main() {}

void test() {
  /*
  expect(sc(2), equals("Aa~ Pa! Aa!", "good luck!"));
  expect(sc(6), equals("Aa~ Aa~ Aa~ Aa~ Aa~ Pa! Aa!", "good luck!"));
  expect(sc(7), equals("Aa~ Aa~ Aa~ Aa~ Aa~ Aa~ Pa!", "good luck!"));
  expect(sc(10), equals("Aa~ Aa~ Aa~ Aa~ Aa~ Aa~ Aa~ Aa~ Aa~ Pa!", "good luck!"));
  expect(sc(1), equals("", "good luck!"));
  expect(sc(-1), equals("", "good luck!"));

  <a href="https://www.codewars.com/kumite/6451775a5017ed8094cf65fd?sel=6451775a5017ed8094cf65fd">Dart Translation</a> waiting for approval.
  */
}

String sc(floor) {
  if (floor <= 1) return '';

  String scream = '';
  for (int i = 1; i < floor; i++) {
    scream += 'Aa~ ';
  }
  if (floor > 6) {
    return scream + 'Pa!';
  } else {
    return scream + 'Pa! Aa!';
  }
}

String sc2(int floor) => floor <= 1
    ? ''
    : floor > 6
        ? 'Aa~ ' * (floor - 1) + 'Pa!'
        : 'Aa~ ' * (floor - 1) + 'Pa! Aa!';
