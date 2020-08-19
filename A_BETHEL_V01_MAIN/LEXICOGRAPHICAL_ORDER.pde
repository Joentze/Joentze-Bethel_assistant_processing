//GIVES ALL POSSIBLE COMBINATIONS FROM THE MAXIMUM NUMBER OF WORDS FROM ARRAY
//TO THE LEAST NUMBER OF WORDS I.E 
// 0 1 2 3 4
// 1 2 3 4
// 1 2 4 3
// 1 3 2 4
// 1 3 4 2
// 1 4 2 3
// 1 4 3 2
// 1 2 3
//...
//https://dev.to/rrampage/algorithms-generating-combinations-100daysofcode-4o0a

String[] lexi(int n, int r){
String[] retArray = {};
  int[] a = new int[r];
// initialize first combination
for (int i = 0; i < r; i++) {
    a[i] = i;
}
int i = r - 1; // Index to keep track of maximum unsaturated element in array
// a[0] can only be n-r+1 exactly once - our termination condition!
while (a[0] < n - r + 1) {
    // If outer elements are saturated, keep decrementing i till you find unsaturated element
    while (i > 0 && a[i] == n - r + i) {
        i--;
    }
    retArray = append(retArray,stringify(a)); // pseudo-code to print array as space separated numbers)
    a[i]++;
    // Reset each outer element to prev element + 1
    while (i < r - 1) {
        a[i + 1] = a[i] + 1;
        i++;
    }
}
return retArray;
}
String stringify(int[] array){
 String[] tempArray = {};
  for(int currInt:array){
   tempArray = append(tempArray,str(currInt));
 }
 String retString = join(tempArray,' ');
 return retString;
}

String[] allStringArr(String[] orderNum,String[] testArray){
 
  String[] retArray = {};
  
  for(String currCombi:orderNum){
    
    String tempString = "";
    int[] arrayNum = {};
    String[] giveNumSplit = split(currCombi,' ');

  for(String currNum:giveNumSplit){
  arrayNum = append(arrayNum,int(currNum));
  }
 
String[] tempArray = {};
for(int currInt:arrayNum){  
String currString = testArray[currInt];
tempArray = append(tempArray, currString);
}

tempString = join(tempArray,' ');
//println(tempString);
retArray = append(retArray,tempString);

}
return retArray;
}

// TAKES IN THE STRINGED ARRAY AND ARRANGES THE NUMBER INTO LEXICOGRAPHICAL ORDER
// THIS IS TO REARRANGE IT USING AN ARRAY
//https://dev.to/rrampage/algorithms-generating-combinations-100daysofcode-4o0a
String[] allPossibleArrangements(String[] testArray){
  
  //NUMBER OF RECURSIONS 
  int n = testArray.length;
  String[] retList = {};
  for(int r = 1; r<n+1; r++){ 
  retList = concat(retList,lexi(n,r));
  }
  return reverse(retList);
}


//RECURSIVE ALGORITHM TO SEARCH A BUNCH OF WORDS THAT DO NOT MATCH WITH 
//THE WORDS IN THE WORD BANKS
//"INPUT" OF ALL POSSIBLE ARRAYS
//"CNT" IS THE POINTER COUNTER 

int[] allNumArray(int n){
int[] reverseArray = {};
for(int cnt = 0; cnt<n; cnt++){
  reverseArray = append(reverseArray,cnt);
}
int[] retArray = reverse(reverseArray);
return retArray;
}



String[] makeAllCaps (String[] inputArray){
  String[] returnArray = {};
  for(String currln : inputArray){
   String caps = currln.substring(0,1).toUpperCase() +currln.substring(1); 
   returnArray = append(returnArray , caps);
  }
  return returnArray ;
}

String makeAllCaps_retString(String currLn){
 
 String retString = ""; 
 String[] splitArr = split(currLn,' ');
 String[] tempCont = {};
 
 for(String currWord:splitArr){
  
  String caps = currWord.substring(0,1).toUpperCase() +currWord.substring(1); 
  tempCont = append(tempCont , caps);
 
 } 
 
 retString = join(tempCont,' ');
return retString;
}
