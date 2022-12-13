void main(){
/*
https://www.codewars.com/kata/564057bc348c7200bd0000ff/train/dart

A Rule of Divisibility by 13

*/

print(thirt(85299258));



}

int thirt(int n) {
  
  List <int> repeating = [1, 10, 9, 12, 3, 4];
  int number = n, ans = 0;

  while(true){
    List <int> digits = number
      .toString()
      .split('')
      .reversed
      .map(int.parse)
      .toList();
    
    for(int i = 0; i<digits.length;i++){
      ans += digits[i] * repeating[i % repeating.length];
    }
    if(number == ans){
      return ans;
    }else{
      number = ans;
      ans = 0;
    }
  }
}