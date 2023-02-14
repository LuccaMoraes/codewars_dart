void main(){
  List<int> a = [2,4,5,6,8,10,12];
  List<int> b = [1,3,5,6];
  List<int> c = [2,4,6,8,12];
  firstIntersection([a,b,c]);
}

int firstIntersection(List<List<int>> lst){
  
  // orders the list from shortest to longest n of multiples
  lst.sort((a, b) => a.length.compareTo(b.length));
  
  
  return 1;
}