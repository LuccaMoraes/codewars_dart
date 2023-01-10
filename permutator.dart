/// https://www.quora.com/How-would-you-explain-an-algorithm-that-generates-permutations-using-lexicographic-ordering
/// 
/// Given this list, this is what I want the algorithm to do:
/// 
/// [a, b, c]
/// print:
/// abc, acb, bac, bca, cab, cba
/// 
/// go through each and every permutation, in lexicographic order, and print it.
/// 
/// 1. Find the largest number that is smaller than the next number:
///     list[i] < list [i+1]
/// 
///     eg.: 1 2 3 4 6 5 -> 4 is largestI
///     4 is smaller than 6 but 6 isn't smaller than 5 (4<6 == true)/(6<5 == false)
/// 
/// 2. Find the second largest number that is smaller than the largest number:
///     list[j] < largestNumber
///     eg.: 1 2 3 4 6 5 
///       4 is largestI
///       3 is largestJ
/// 
/// 3. Swap largestI and largestJ.
/// 
/// 4. Reverse

void main(){
  
  print(permutator(['a','b','c']));
}

List ansArray = [];
List temp = [];

List permutator(List s){
  print(s);
  ansArray.add(s);
  
  // Step 01: Go to last pair and reverse it
  temp =  reverseLastPair(s);
  print(temp);

  // Step 02: Check if ansArray already has temp combination
  if(ansArray.contains(temp)){
    // get one letter from the left
    temp = reverseLastTrio(s);
    // reverse verything starting from it
    // start step 02 again
  }else{
    ansArray.add(temp);
    // go to step 01 passing the last index of ansArray
    permutator(ansArray.last);
  }

  

  return[];
}

List reverseLastPair(List s){
  List lastPair = s.sublist(s.length-2).reversed.toList();
  List listBegining = s.sublist(0, s.length-2).toList();
  return listBegining + lastPair;
}
List reverseLastTrio(List s){
  List lastPair = s.sublist(s.length-3).reversed.toList();
  List listBegining = s.sublist(0, s.length-3).toList();
  return listBegining + lastPair;
}