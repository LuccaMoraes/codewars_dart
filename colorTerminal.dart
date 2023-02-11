/*
Black:   \x1B[30m
Red:     \x1B[31m
Green:   \x1B[32m
Yellow:  \x1B[33m
Blue:    \x1B[34m
Magenta: \x1B[35m
Cyan:    \x1B[36m
White:   \x1B[37m
Reset:   \x1B[0m

E.g. 
*/
void main(List<String> args) {
  print('\x1B[31mHi in red, \x1B[32mHi in green, \x1B[0mback in default');
}