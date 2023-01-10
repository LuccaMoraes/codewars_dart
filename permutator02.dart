void main(){
  
  print(permutationOf(['a','b','c']));
  
}

List temp = [];

List permutationOf(List list){
  temp.add(list[0]);

  if(list.length == 1) return list;

  temp = permutationOf(list.sublist(1));


  return temp;
}