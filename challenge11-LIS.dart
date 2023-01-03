/*
Challenge Idea from https://www.youtube.com/watch?v=aPQY__2H3tE

Find the lenght of the longest increasing subsequence:

Constraints: i1 < i2 < ... in
*/

void main(){
List <int> a = [8,2,5];
int aResult = 3;

List <int> b = [5,2,8,6,3,6,9,5];
int bResult = 4;

//print(lis(a) == aResult);
//print(lis(b) == bResult);

print(lis(a));
//print(lis(b));

}

List path = [];

int lis(List<int> list) {
  int current = list[0];
  
  for (int i = 1; i < list.length; i++) {
    if(current<list[i]){

    }
    continue;
  }

  
  

  return 0;
}
