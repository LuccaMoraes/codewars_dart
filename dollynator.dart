import 'dart:math';

void main() {
  /*
  ão -> aum
  i -> y
  e -> i
  m -> n
  n -> m
  á -> ah
  ó -> oh
  é -> eh

  caso não seja a primeira ou ultima letra
  l -> ll
  t -> tt
  
  remover ultima letra da palavra caso
  r
  s
  
  aleatorizar captalization
  
   */

  print(dollynator('o bolsonaro não é corrupto, ele é o melhor presidente do brasil'));
}

String dollynator(String s) {
  s = s
      .toLowerCase()
      .replaceAll('i', "y")
      .replaceAll('ão', "aum")
      .replaceAll('ç', "ss")
      .replaceAll('é', "eh")
      .replaceAll('ó', "oh")
      .replaceAll('á', "ah");

  String temp = '';

  for (int i = 0; i < s.length; i++) {
    //Random().nextBool() ? temp += s[i] : temp += s[i].toUpperCase();
    i.isEven ? temp += s[i] : temp += s[i].toUpperCase();
  }

  String ans = '';
  temp.split(' ').forEach((word) {
    if (word.toLowerCase().endsWith('r') ||
        word.toLowerCase().endsWith('n') ||
        word.toLowerCase().endsWith('s')) {
      ans += ' ${word.substring(0, word.length - 1)}';
    } else {
      ans += ' $word';
    }
  });

  return ans.trim();
}
