void main(){
/*
https://www.codewars.com/kata/valid-parentheses

Valid Parentheses
"()"              =>  true
")(()))"          =>  false
"("               =>  false
"(())((()())())"  =>  true
*/

  print(validParentheses(")(()))"));

}

bool validParentheses(String braces) {
  int open = 0;

  for(int i = 0; i < braces.length; i++){
    if(open < 0)return false;
    braces[i] == "(" ? open++ : open-- ;
  }
  return open == 0;
}