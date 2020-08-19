void bestMatched() {

  println("matching...");
  //SEGMENTSTRING
  String[] segString =segmentString(inputString);  
  //INPUT_TOKENCOMBI
  int[] inTokenCom = input_tokenCombi(segString, listWordBanks);
  //LABELS
  printArray(inTokenCom);
  String[] cLabels =labels(directory_02_tokenCombiTask, tokenCombiFunctions);
  //APPEND_NOOFMATCHFOUND
  float[] listOfMatches = APPEND_NOOFMATCHFOUND(directory_02_tokenCombiTask, inTokenCom, cLabels, tokenCombiFunctions);
  //NAMEOFHIGHEST  
  //printArray(listOfMatches);
  NOH = nameOfHighest(cLabels, listOfMatches);  
  //return print
  println(NOH);
}


//TAKES THE INPUT STRING IN AND PARSES IT THROUGH WORD BY WORD
//IF THE WORD MATCHES WITH A WORD BANK NUMBER (I.E 01_NOUNS) THE WORD IS TAGGED BY THAT NUMBER
// LIKE "YOU - 01", YOU BEING A NOUN

int[] input_tokenCombi (String[] segmentString, String[] listWordBanks) { 

  int[] returnCombiList = {};
  int inputLength = segmentString.length;
  int fileLength = listWordBanks.length;

  for (String currInWord : segmentString) {

    for (int cnt = 0; cnt<fileLength; cnt++) {

      for (String currentToken : loadCurrentFiles(directory_01_wordBanks, listWordBanks[cnt])) {

        if (currInWord.equals(currentToken)) {

          returnCombiList = append(returnCombiList, cnt+1);
        }
      }
    }
  }
  //printArray(returnCombiList);
  return returnCombiList;
}

//TAKES THE COMBI TXT FILE AND LINE GIVEN THE LINE NUMBER LISTE IN "pointerVal" TAKES
//THE NUMBERICAL COMBI AND STORES IT IN AN INTEGER ARRAY => 1/2/5 ={1,2,5}
int[] currentCombiString(String directory, String tokenCombiCurr, int pointerVal) {

  int[] combiLineRet = {};

  String[] currentArray = loadStrings(directory+"/"+tokenCombiCurr);

  String[] seperation = split(currentArray[pointerVal], ':');
  String[] currentCombiLnSp  = split(seperation[0], '/');
  for (String cnLn : currentCombiLnSp) {
    combiLineRet = append(combiLineRet, int(cnLn));
  }

  //printArray(combiLineRet);
  return combiLineRet;
}


int[] currentCombi(String directory, String tokenCombiCurr, int pointerVal) {

  int[] combiLineRet = {};

  String[] currentArray = loadStrings(directory+"/"+tokenCombiCurr);

  String[] seperation = split(currentArray[pointerVal], ':');
  //printArray(seperation);
  String[] currentCombiLnSp  = split(seperation[1], '/');
  for (String cnLn : currentCombiLnSp) {
    combiLineRet = append(combiLineRet, int(cnLn));
  }

  //printArray(combiLineRet);
  return combiLineRet;
}


float numberOfMatchesFound(int[] input_tokenCombi, int[] currentCombi) {

  float[] matchedNumbers = {};
  float numberOfMatches;

  for (int currentTokenNo : input_tokenCombi) {
    for (int currentCombiNumber : currentCombi) {

      if (currentTokenNo==currentCombiNumber) {
        matchedNumbers = append(matchedNumbers, currentTokenNo);
      }
    }
  }
  if (matchedNumbers!=null) {
    
    println(matchedNumbers.length+"/"+currentCombi.length);
    
    int IntIn = currentCombi.length;
    int IntCC = matchedNumbers.length;
    float IN = (float)IntIn;
    float CC = (float)IntCC;
    
    numberOfMatches = CC/IN;
 
 println("float: "+numberOfMatches);
 println(" ");
} else {
    numberOfMatches = 0;
  }
  return numberOfMatches;
}
//TAKES THE LABEL NAMES OF THE COMBINATIONS AND STORES THEM IN A STRING ARRAY
String[] labels(String directory, String[] tokenCombiFunctions) {
  String[] retLabel = {};
  for (String toLoad : tokenCombiFunctions) {
    String[] currentArray = loadStrings(directory+"/"+toLoad);
    //printArray(currentArray);
    for (String currentLine : currentArray) {
      String[] seperation = split(currentLine, ':');
      retLabel = append(retLabel, seperation[0]);
    }
  }
  return retLabel;
}

//TAKES THE TOKEN COMBINATION OF THE INPUT STRING AND MATCHES THEM WIUTH ALL THE COMBINATIONS
//PLACES THE NUMBER OF MATCHES FOUND IN AN INTEGER ARRAY
float[] APPEND_NOOFMATCHFOUND(String directory, int[] input_tokenCombi, String[] labels, String[] tokenCombiFunctions) {

  int iterationVal = labels.length;
  float[] matchFunctionsList ={};

  for (int cnt = 0; cnt<iterationVal; cnt++) {
    for (String toLoad : tokenCombiFunctions) {
      //println(toLoad);
      int[] arrayCheck = currentCombi(directory, toLoad, cnt);

      float currentMatchNumber = numberOfMatchesFound(input_tokenCombi, arrayCheck);

      matchFunctionsList = append(matchFunctionsList, currentMatchNumber);
    }
  }
  return matchFunctionsList;
}

//COMPARES WHICH LABELLED COMBI FROM TXT FILE HAD THE HIGHEST NUMBER OF MATCHES
//RETURNS THE NAME OF THE HIGHEST AND BEST SUITED NAME OF FUNCTION.
String nameOfHighest(String[] labels, float[] numberOfMatches) {
  // int prevVal;
  float currentVal;
  float highestVal = 0;
  int indexNo = 0;
  //printArray(labels);
  float tempSum = 0;
  for(float tempFloat:numberOfMatches){
  tempSum += tempFloat; 
  }
  if(tempSum != 0){
  for (int c = 0; c<numberOfMatches.length; c++) {
    currentVal = numberOfMatches[c];
    if (numberOfMatches[c]>=highestVal) {
      highestVal = currentVal;
      indexNo = c;
    } else if (numberOfMatches[c]<=currentVal) {
    }
  }}
 
  //println(indexNo);
  String retString = labels[indexNo];
  return retString;
}
