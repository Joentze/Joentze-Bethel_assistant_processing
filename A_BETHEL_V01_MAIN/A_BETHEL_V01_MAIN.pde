//LIBRARIES USED
import java.util.Map;
import http.requests.*;

//TEST INPUT STRING
String inputString = "what is the latest news in singapore";

/*DIRECTORY---> FILE NAME 
NOTATION DIRECTORY_XX---> XX = THE TYPE*/
String directory_01_wordBanks = "wordBanks";
String directory_02_tokenCombiTask = "tokenCombiTask";
String directory_03_keyPhrases = "Phrases";

//LIST OF TXT FILES TO LOOK FOR
String[] listWordBanks ={"01_GREETINGS.txt","02_AUXILLARY_VERBS.txt","03_VERBS.txt","04_PREPOSITIONS.txt","05_TIMINGS.txt","06_GENERAL_NOUNS.txt","07_5W1H.txt","08_METRICS.txt","09_NEWS_NOUN.txt","10_SEARCH_NOUNS.txt"};  
String[] tokenCombiFunctions ={"01_LIST_OF_COMBI.txt"};
String[] phrasesList = {"01_NEWS.txt","02_SEARCH.txt","03_WOLFRAM.txt"};

//HASHMAP FOR THE COMBINATION LIST 
HashMap<String,Integer> combiHashList = new HashMap<String,Integer>();

//NAME OF HIGHEST MATCH
String NOH = "";

//CLASS DECLARATIONS (I.E SEARCH, NEWS SEARCH, IOT ...)
generalSearch srch = new generalSearch();
newsSearch newsS = new newsSearch();

//NEWS


//CURRENT NEWS
String[][] news;

//ONLINE SEARCH
String[] searchArray = {};
String wolfram_return = "";

 void setup(){
   // printArray(newsNounSearched(inputString,concatAllPhrases(directory_03_keyPhrases,phrasesList[0])));
bestMatched(); 
loadHashmap(directory_02_tokenCombiTask,tokenCombiFunctions[0]);
println(combiHashList.get(NOH));
//printArray(input_tokenCombi(segmentString(inputString),listWordBanks));   
//printArray(listOfFunctions(directory_02_tokenCombiTask,tokenCombiFunctions[0]));
//printArray(concatWords_all(directory_01_wordBanks,listWordBanks));
//printArray(concatAllPhrases(directory_03_keyPhrases,phrasesList[0]));
execute();
//printArray(newsNounSearched(inputString,concatAllPhrases(directory_03_keyPhrases,phrasesList[0])));
/*GNewsGet.send();

 news = JSONparse(GNewsGet.getContent(),objectsInArticle);
println(GNewsGet.getContent());
for(int cnt = 0; cnt< 10; cnt++){
 println(news[0][cnt]);
 println(news[1][cnt]);
 println(news[2][cnt]);
  println(news[3][cnt]);
 println(" ");
}*/
 }
 
 
 //LOADS CURRENT FILES AND STORES INTO A STRING ARRAY
 String [] loadCurrentFiles(String fileListed,String fileToLoad){
  
String[] returnList = {};
  
returnList = loadStrings(fileListed+"/"+fileToLoad);

return returnList;
    
}


// PLACES ALL KEY WORDS IN A FULL WORD LIST FOR MORE SEARCHABLE LIST BUT LESS SPECIFIC SEARCH
String [] concatWords_all(String directory, String[] listWordBanks){
  
  String[] fullList = {};
  
  for(String currFileToLoad: listWordBanks){
  
  String[] currArray = loadStrings(directory+"/"+currFileToLoad);
  fullList = concat(fullList,currArray);
    
  }
  
  return fullList;
  
}

String[] concatAllPhrases(String directory, String fileName){
  String[] retArray = {};
  String[] loadedFile = loadStrings(directory+"/"+fileName);
 for(String currLine:loadedFile){
   String[] tempSplit = split(currLine,' ');
   for(String currWord:tempSplit){
     retArray = append(retArray,currWord);
   }
 }
 return retArray; 
}

void testPrintNews(String[][] news){
 for(int c = 0; c<10;c++){ 
  println(news[0][c]);
   println(news[1][c]);
    println(news[2][c]);
     println(news[3][c]);
     println(" ");
 }
}
