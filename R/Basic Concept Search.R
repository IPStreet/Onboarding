library(httr)

concept_search <- function(claim_text){
  #basic function which sends POST request to the /claim_only/
  #Note: {q:{}} parameter is omitted so defaults will be used by server
  r = POST(url = "https://api.ipstreet.com/v1/full_text",
           add_headers(`x-api-key`="whIz2NmpUf8rGvR2h5oMs9RnPW0byrPG685qAl6e"),
           body = list(raw_text= claim_text),
           encode ="json")
  
  print(content(r))
  
}


results_to_dataframe <- function(results){
  #create empty object to put data frame into
  patents = NULL
  print(length(results$Asset))
  #loop over results, making each a row in your data frame
  for (i in 1:length(results$Asset)){
    print(as.data.frame(results$Asset[[i]]))
    row <- as.data.frame(results$Asset[[i]])
    patents = rbind(row,patents)
  }
  
  #little bit of clean up to make life easier down the line
  patents[patents==""] <- NA 
  patents[ order(patents$index_position), ]
  
  #return the pretty dataframe
  return(patents) 
  }

#BEGIN RUN

#Get some text that you want to use as you raw search seed
claim1 <- "a configurable battery pack charging system coupled to said charging system controller, said battery pack and a power source, wherein said configurable battery pack charging system charges said battery pack in accordance with said battery pack charging conditions set by said charging system controller."

#run the function and store results as a list of lists
concept_search_results <- concept_search(claim1)

results_dataframe <- results_to_dataframe(concept_search_results)
