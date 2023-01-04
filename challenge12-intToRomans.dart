void main(){
  /*
  roman generator to be used in the translation to Dart for the following kata
  https://www.codewars.com/kata/51b6249c4612257ac0000005

  Symbol      Value
  I             1
  V             5
  X             10
  L             50
  C             100
  D             500
  M             1000


  */

  print(toRoman(675));
  print(intToRoman(675));
}

String toRoman (int n) {

  List romans = [
    ['M', 1000], ['CM', 900], ['D', 500], ['CD', 400], 
    ['C',  100], ['XC',  90], ['L',  50], ['XL',  40],  
    ['X',   10], ['IX',   9], ['V',   5], ['IV',   4],   
    ['I',    1]
  ];

  String ans = '';

  for (int i = 0; n > 0 && i < romans.length; i++) {
    while (n >= romans[i][1]) {
      ans += romans[i][0];
      n -= romans[i][1] as int;
    }
  }
  return ans;  
  }




String intToRoman (int n){
  int m = n~/1000;
  int c = (n-1000*m)~/100;
  int x = (n-1000*m-100*c)~/10;
  int i = n-1000*m-100*c-10*x;

  String ans = '';

  //milhar
  ans += 'M'*m;

  //centena
  if(c == 9){
    ans += 'CM';
  }else if(c >=5){
    ans += 'D'+'C'*(c-5);
  }else if(c == 4){
    ans += 'CD';
  }else{
    ans += 'C'*c;
  }

  //dezena
  if(x == 9){
    ans += 'XC';
  }else if(x >=5){
    ans += 'L'+'X'*(x-5);
  }else if(x == 4){
    ans += 'XL';
  }else{
    ans += 'X'*x;
  }

  //unidade
  if(i == 9){
    ans += 'IX';
  }else if(i >=5){
    ans += 'V'+'I'*(i-5);
  }else if(i == 4){
    ans += 'IV';
  }else{
    ans += 'I'*i;
  }

  return ans;
}