
void main(){

  /*
  Gap in Primes
  https://www.codewars.com/kata/561e9c843a2ef5a40c0000a4/train/dart
  5kyu

  return the first pair of two prime numbers spaced with a gap of 'g' between 
  the limits 'm', 'n' if these numbers exist, otherwise '[]'
  
  g = the gap we are looking for
  m = the start of the search (m inclusive)
  n = the end of the search (n inclusive)


  gap(2,3,50) == [3,5]

  To Do:

  1. implement a bool function that evaluates if a number is prime - DONE
  2. create a loop that finds all primes between two numbers*
  3. create a function that compares the last found prime with the current prime
    and returns the gap.

  */

  test();

  //print(isPrime(71));
  print(gap(2, 3, 50));
  print(([3, 5]));

  // if you dont convert  to string, dart will compare the identity of the list, not its content
  print(gap(2, 3, 50).toString() == [3, 5].toString());




}

List<int> gap(int g, int m, int n) {
  int lastPrime = 0;

  for (int i = m; i <= n; i++) {
    if (!isPrime(i)) continue;

    if (i - lastPrime == g) {
      return [lastPrime, i];
    }
    lastPrime = i;
  }

  return [];
}

bool isPrime(n) {
  if (n == 2) return true;
  if (n % 2 == 0) return false;

  for (int i = 3; i < n; i++) {
    if (n % i == 0) return false;
  }

  return true;
}





void test() {
  print(gap(2, 3, 50).toString() == [3, 5].toString());
  print(gap(2, 100, 110).toString() == [101, 103].toString());
  print(gap(2, 101, 103).toString() == [101, 103].toString());
  print(gap(4, 100, 110).toString() == [103, 107].toString());
  print(gap(6, 100, 110).toString() == [].toString());
  print(gap(8, 300, 400).toString() == [359, 367].toString());
  print(gap(10, 300, 400).toString() == [337, 347].toString());
}
