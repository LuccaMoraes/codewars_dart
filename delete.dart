void main() {

}
//solution found on codewars
String convertFrac2(lst) {
  lst = lst.map((x) {
    int d = x[0].gcd(x[1]);
    return [x[0] ~/ d, x[1] ~/ d];
  });
  final lcm = lst.fold(1, (r, x) => r * x[1] ~/ r.gcd(x[1]));
  return lst.map((x) => '(${x[0] * lcm ~/ x[1]},$lcm)').join();
}
