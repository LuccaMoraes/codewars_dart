void main(){
  /*
  https://www.codewars.com/kata/5a4e3782880385ba68000018/train/dart

  


  */
  int num = 44862;
  print(balancedNum(num));
  print(balancedNum(num));

}

String balancedNum(int numb) {
  String n = numb.toString();
  int nl = n.length;
  String evenOdd = nl%2 == 0 ? "evenLength": "oddLength";
  int sumLeft = 0;
  int sumRight = 0;
  int middle = nl~/2;
  
  print("numero $n");
  print("length: $nl");
  print("its $evenOdd");
  print("the middle index is $middle");
  print("middle char is ${n[middle]}");
  
  switch(evenOdd){
      case "evenLength":
        //do shit
        for(int i = 0; i < middle-1;i++){
          sumLeft += int.parse(n[i]);
        };
        print("sum left is $sumLeft");
        for(int i = middle+1; i < nl;i++){
          sumRight += int.parse(n[i]);
        };
        print("sum right is $sumRight");
        break;

      case "oddLength":
        for(int i = 0; i < middle;i++){
          sumLeft += int.parse(n[i]);
        };
        print("sum left is $sumLeft");
        for(int i = middle+1; i < nl;i++){
          sumRight += int.parse(n[i]);
        };
        print("sum right is $sumRight");
        break;
  };
  
  
  return sumLeft == sumRight? "Balanced" : "Not Balanced";
}

String balancedNum2(int numb) {
  String n = numb.toString();
  int nl = n.length;
  int sumLeft = 0;
  int sumRight = 0;
  int middle = nl~/2;

  for(int i = 0; i < nl ; i++){
    if(nl%2==0){
      if(i<middle-1){
        sumLeft += int.parse(n[i]);
      }else if(i >=middle+1){
        sumRight += int.parse(n[i]);
      }
    }else{
      if(i<middle){
        sumLeft += int.parse(n[i]);
      }else if(i >=middle+1){
        sumRight += int.parse(n[i]);
      }
    }
  };
  
  return sumLeft == sumRight? "Balanced" : "Not Balanced";
}
