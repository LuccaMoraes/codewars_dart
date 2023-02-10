void main(){

  tester();
}


int duplicateCount(String text){
  text = text.toLowerCase();
  String old = '';
  Set<String> uniqueCharacters = {};
  
  for(int i = 0; i < text.length; i++){
    
    if(old.contains(text[i])){
      uniqueCharacters.add(text[i]);
    }
    old = old+text[i];
  }

  return uniqueCharacters.length;
}
void tester(){
  duplicateCount('text');
  duplicateCount("");
  duplicateCount("abcde");
  duplicateCount("aabbcde");
  duplicateCount("aabBcde");
  duplicateCount("Indivisibility");

}