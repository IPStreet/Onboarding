library(httr)
library(jsonlite)

# a basic search by owner
search_by_patent_number <-  function(patent_numbers){
  
  #basic one parameter Basic Data Feed Search. 
  #Defaults used for all other values
  r = POST(url = "https://api.ipstreet.com/v1.1/data/patent",
           add_headers(`x-api-key`="5AsaMTe6HUypUlAqv3Rw3E6Pvjo4dYL64Rr2z2va"),
           body = list(q= list(patent_number= patent_numbers)),
           encode ="json")
  
}

results_to_dataframe <- function(results){
  #loop over content of response, making each a row in your data frame
  patents <-do.call("rbind", content(results))
  
  return(patents) 
}

#BEGIN RUN

#set some text for the owner you want to search for.
patent_numbers = "8618773"

#run the function and store results as a list of lists
results <- search_by_patent_number(patent_numbers)

results_dataframe <- results_to_dataframe(results)

