
void main(){

  print(countSmileys( [":~D", ";~)", ":)", ";>", ":D", ";o>", ";D"]));
}

int countSmileys(List<String> arr) => arr.map((e) => [':)',';)',':-)',';~)',';-)',':D',';D',':-D',';~D',':~D',';-D',':~)'].contains(e) ? e+"ç" :'').join().split('ç').length;