void main(){

  tester();
}

int duplicateCount(String text){
  text = text.toLowerCase();
  Map<String, int> charCounts = {};
  Set<String> duplicates = {};
  
  for(int i = 0; i < text.length; i++){
    String char = text[i];
    charCounts[char] = charCounts.containsKey(char) ? charCounts[char]! + 1 : 1;
    
    if(charCounts[char]! > 1){
      duplicates.add(char);
    }
  }

  return duplicates.length;
}
void tester(){
  duplicateCount('text');
  duplicateCount("");
  duplicateCount("abcde");
  duplicateCount("aabbcde");
  duplicateCount("aabBcde");
  duplicateCount("Indivisibility");

}