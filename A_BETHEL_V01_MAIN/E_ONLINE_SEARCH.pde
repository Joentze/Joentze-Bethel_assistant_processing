
 /* 
  String wolfram_APIkey = "JK3YYP-LPYQXL27Q6";
  String GnewsAPIkey ="a35fef88d2a3d50d06038787a88db636";
  String newsAPIkey = "5de06ea6e0af401c9e76638f7c27454c";
  String WikiContainerStringAPI = "https://en.wikipedia.org/w/api.php?format=xml&action=query&prop=extracts&exintro&explaintext&redirects=1&titles=";
  */
  
 
  String wolfram_APIkey = "JK3YYP-LPYQXL27Q6";
  
class generalSearch{
  
  String rawInput = "";
  
  void wolframAlpha(String input){
  
    GetRequest wolfram_S = new GetRequest("http://api.wolframalpha.com/v1/result?appid="+wolfram_APIkey+"&i="+returnString(input,"+")+"%3f");   
    wolfram_S.send();
    wolfram_return = wolfram_S.getContent();
    println(wolfram_return);
    
  }
  
  void wikiSearch(String input){
    rawInput = input;
    String toBeSearched = join(NounsToBeSearched(input,directory_01_wordBanks,listWordBanks),' ');
   
 if(isPhrasePres(input,loadCurrentFiles(directory_03_keyPhrases,phrasesList[0])) == false){
   
 searchFunction(toBeSearched);
     
 }
  
  else if(isPhrasePres(input,loadCurrentFiles(directory_03_keyPhrases,phrasesList[0])) == true){
 
  println("do you want me to search for the news instead");
   newsS.getNews(inputString);
   testPrintNews(news);
}
}



void searchFunction(String toBeSearched){
     try{
       
 try{    
   
  GetRequest WikiGet = new GetRequest("https://en.wikipedia.org/w/api.php?format=xml&action=query&prop=extracts&exintro&explaintext&redirects=1&titles="+returnString(toBeSearched,"%20"));
  WikiGet.send();
  XML pageListed = parseXML(WikiGet.getContent());
  String[] retArray = XMLreturn(pageListed);
  String errorTrig = retArray[1];
  searchArray = retArray;
 printArray(searchArray);
 
//printArray(sepQuery);
}
catch(ArrayIndexOutOfBoundsException e){
 println("trying alternative search configuration...");
     altWikiSearch(toBeSearched);

}

     }
     catch(RuntimeException e){
       
       println("is the internet down?");

     }
}

void altWikiSearch(String toBeSearched){
  
  try{
  println(jointString(toBeSearched));
  GetRequest WikiGet = new GetRequest("https://en.wikipedia.org/w/api.php?format=xml&action=query&prop=extracts&exintro&explaintext&redirects=1&titles="+jointString(toBeSearched));   
  WikiGet.send();
  XML pageListed = parseXML(WikiGet.getContent());
  String[] retArray = XMLreturn(pageListed);
  String errorTrig = retArray[1];
  searchArray = retArray;
  
  printArray(searchArray);
  
}

  catch(ArrayIndexOutOfBoundsException e){
    println("trying brute search");
 String[] arrayCheckLength = split(rawInput,' ');
 if(arrayCheckLength.length<=7){
 String[] makeTitle = makeAllCaps(arrayCheckLength);
 String[] inputArray = allStringArr(allPossibleArrangements(makeTitle),makeTitle);
 bruteSearch(inputArray,1);
// printArray(searchArray);
 }else{
println("try a different statement");
 }
  } 
  
}

void bruteSearch(String[] array,int cnt){
  
//TRIES TO SEARCH THE CURRENT STRING USING WIKIPEDIA API  
try{
try{
  //HTTP REQUEST LIBRARY
 GetRequest WikiGet = new GetRequest("https://en.wikipedia.org/w/api.php?format=xml&action=query&prop=extracts&exintro&explaintext&redirects=1&titles="+makeAllCaps_retString(returnString(array[cnt],"%20")));   
  WikiGet.send();
  XML pageListed = parseXML(WikiGet.getContent());
  String[] retArray = XMLreturn(pageListed);
  //IF THERE IS NO RESULT RETURNED THE ARRAY AT ARRAY[1] WILL BE EMPTY AND WILL GIVE 
  //ARRAYINDEXOUTOFBOUNDSEXCEPTION, THIS WILL CALL THE CATCH FUNCTION
  String errorTrigger = retArray[1];
  println(retArray[0]);
  searchArray = retArray;
printArray(searchArray);
  
}
catch(ArrayIndexOutOfBoundsException e){

  //WHEN THE CATCH FUNCTION IS CALLED THE CNT (COUNTER) WILL MOVE THE POINTER TO THE NEXT STRING TO BE 
  //SEARCHED, IT WILL DO THIS BE CALLING THE FUNCTION AGAIN, THIS FUNCTION IS RECURSIVE
if(cnt<=array.length){
  //***THE IF STATEMENT IS TO PREVENT STACKOVERFLOW ERROR BY RESTRICTING THE NUMBER OF SEARCHES TO 
  //THE LENGTH OF THE ARRAY INPUT
  cnt++;
  bruteSearch(array,cnt);
}
else{
  println("nothing found");
}
}
}

catch(RuntimeException e){
println("the internet may be down");

}

}

  }
String[] NounsToBeSearched(String inputString,String directory, String[] fileList){

String[] seperation = segmentString(inputString);
String[] wordListCheck = concatWords_all(directory,fileList);
String[] listOfUnidentified = seperation;

for(String currWord:seperation){
 for(String currLn:wordListCheck){
  if(currWord.equals(currLn)){ 
  listOfUnidentified = new_removed(listOfUnidentified,currWord);
  }
 }
}
return listOfUnidentified;

}

  boolean isPhrasePres(String input,String[] matchPhrases){
  boolean retBool = false;
  
  for(String currWd:matchPhrases){
    
  String[] matches = match(input,currWd);
  if(matches != null){
  retBool = true;
  }
    
}
return retBool;
}
