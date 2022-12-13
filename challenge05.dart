void main(){
/*
  https://www.codewars.com/kata/5264d2b162488dc400000001

  Stop gninnipS My sdroW!

  Write a function that takes in a string of one or more words, and returns the same string,
  but with all five or more letter words reversed (Just like the name of this Kata).
  Strings passed in will consist of only letters and spaces.
  Spaces will be included only when more than one word is present.

  spinWords( "Hey fellow warriors" ) => returns "Hey wollef sroirraw" 
  spinWords( "This is a test") => returns "This is a test" 
  spinWords( "This is another test" )=> returns "This is rehtona test"

 */




  //print(spinWords("Hey fellow warriors"));
  print(spinWords2("Hey fellow warriors"));
}
String spinWords(String str) {

  List <String> sentence = str.split(" "), ans = [];

  sentence.forEach((word) {
    word.length >= 5? ans.add(word.split('').reversed.join()): ans.add(word);
  });

  return ans.join(' ');
}

String spinWords2(String str) => str.split(' ').map((word) => word.length >= 5? word.split('').reversed.join():word,).join(" ");
