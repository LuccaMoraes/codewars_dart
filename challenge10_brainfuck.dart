
void main(){

  /*
  BrainFuck
  https://www.codewars.com/kata/526156943dfe7ce06200063e

  Translating from python to dart
  
  */
  brainLuck(",+[-.,+]", "Codewars${new String.fromCharCode(128)}");
  print(brainLuck(",+[-.,+]", "Codewarsss"));
}

String brainLuck(String code, String program_input) {
  List ascii_ans = [0];
  String str_output = '';
  int code_pointer = 0;
  int array_pointer = 0;
  int program_input_index = 0;

  pointerSwitch:
  while (code_pointer < code.length) {
    switch (code[code_pointer]) {
      case '>': array_pointer++; break;
      case '<': array_pointer--; break;
      case '+':
        ascii_ans[array_pointer]++;
        ascii_ans[array_pointer] == 256 ? ascii_ans[array_pointer] = 0 : '';
        break;
      case '-':
        ascii_ans[array_pointer]--;
        ascii_ans[array_pointer] == -1 ? ascii_ans[array_pointer] = 255 : '';
        break;
      case '.':
        str_output += String.fromCharCode(ascii_ans[array_pointer]);
        break;
      case ',':
        if (program_input_index >= program_input.length) {
          break pointerSwitch;
        }
        ascii_ans[array_pointer] = program_input[program_input_index]
            .codeUnitAt(0); // might throw an error
        program_input_index++;
        break;
      case '[':
        if (ascii_ans[array_pointer] == 0) {
          int open_counter = 0;
          code_pointer++;
          while (code_pointer < code.length) {
            // 'break' might apply to switch and not to while
            if (code[code_pointer] == ']') {
              if (open_counter == 0) break;
              open_counter--;
            } else if (code[code_pointer] == '[') {
              open_counter++;
            }
            code_pointer++;
          }
        }
        break;
      case ']':
        if (ascii_ans[array_pointer] != 0) {
          int closed_counter = 0;
          code_pointer--;
          while (code_pointer >= 0) {
            if (code[code_pointer] == '[') {
              if (closed_counter == 0) break;
              closed_counter--;
            } else if (code[code_pointer] == ']') {
              closed_counter++;
            }
            code_pointer--;
          }
        }
        break;
    }

    try {
      ascii_ans[array_pointer];
    } on Error {
      ascii_ans.add(0);
    }
    code_pointer++;
  }
  return str_output;
}
