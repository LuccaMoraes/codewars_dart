void main (){
  /*
  https://leetcode.com/problems/roman-to-integer/
  
  Symbol      Value
  I             1
  V             5
  X             10
  L             50
  C             100
  D             500
  M             1000
  

  'III' = 3 = 1+1+1
  'LVIII' = 58 = 50+5+1+1+1
  'MCMXCIV' = 1994 = 1000+(1000-100)+(100-10)+(5-1)
    +1000-100+1000-10+50-1+5
  'MDCCCV' = 1805 = 1000+500+100+100+100+5
 
  1 <= s.length <= 15
  s contains only the characters ('I', 'V', 'X', 'L', 'C', 'D', 'M').
  It is guaranteed that s is a valid roman numeral in the range [1, 3999]

    if(i == temp.length-1 || temp[i] >= temp[i+1]){
      ans += temp[i];
    }else if(temp[i] < temp[i+1]){
      ans -= temp[i];
    }
 */

  print(romanToInt('MMDCCCLXXXIII'));
}

int romanToInt(String s){

  Map toDec = {'I':1,'V':5,'X':10,'L':50,'C':100,'D':500,'M':1000,};

  int ans = 0;
  List <int> temp = [];

  s.split('').forEach((e) => temp.add(toDec[e]));

  for (int i = 0; i < temp.length; i++) {
    i == temp.length - 1 || temp[i] >= temp[i + 1]
        ? ans += temp[i]
        : ans -= temp[i];
  }

  return ans;
}


