

//OPENS THE FILE CONTAINING THE COMBINATION OF NUMBERS FOR SPECIFIC FUNCTION
//I.E SEARCH_NEWS: 1/2/3...
String[] listOfFunctions(String directory,String fileName){
  
  String[] retListFunc = {};
  String[] mainList = loadStrings(directory+"/"+fileName);
  
  for(String currLn:mainList){
  
    String[] splitList = split(currLn,':');
  
  if(splitList!=null && splitList.length == 2){
  retListFunc = append(retListFunc,splitList[0]);
  }

}
return retListFunc;
}

//STORES THE LIST OF FUNCTIONS INTO A HASHMAP
// THIS ALLOWS FOR STRING INDEXED LIST FOR SWITCH STATEMENTS TO EXECUTE FUNCTIONS
