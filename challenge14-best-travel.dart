void main(){
  /*

    https://www.codewars.com/kata/55e7280b40e1c4a06d0000aa/train/dart
    
    nPr = n! / (n-r)!

    nPr = permutation
    n = total number of objects
    r = number of objects selected
   */

  List a = [50, 55, 56, 57, 58];
  List<List> res = [[50,55,57],[50,55,58],[50,55,60],[50,57,58],[50,57,60],[50,58,60],[55,57,58],[55,57,60],[55,58,60],[57,58,60]];

  print('${findAllValidPerms(a)}'=='$res');
  print(findAllValidPerms(a));
  print(res);
}

int chooseBestSum(int mileage, int towns, List<int> ls) {


    
  return -1;
}

Set<String> findAllValidPerms(ls) {
  Set<String> allValidPerms = {};

  void permutate(List lst, int pointer) {
    //when the pointer is equal to lst.length, a permutation was found
    if (pointer == lst.length) {
      //if this is a valid permutation, save it
      allValidPerms.add(lst.join());
      return;
    }

    for (int i = pointer; i < lst.length; i++) {
      List permutation = List.from(lst);
      permutation[pointer] = lst[i];
      permutation[i] = lst[pointer];
      permutate(permutation, pointer + 1);
    }
  }

  permutate(ls, 0);

  return allValidPerms;
}