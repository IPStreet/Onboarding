library(httr)
library(jsonlite)

# a basic search by owner
search_by_owner <-  function(owner_name){
  
  #basic one parameter Basic Data Feed Search. 
  #Defaults used for all other values
  r = POST(url = "https://api.ipstreet.com/v1.1/data/patent",
           add_headers(`x-api-key`="5AsaMTe6HUypUlAqv3Rw3E6Pvjo4dYL64Rr2z2va"),
           body = list(q= list(owner= owner_name)),
           encode ="json")
  
}

results_to_dataframe <- function(results){
  #loop over content of response, making each a row in your data frame
  patents <-do.call("rbind", content(results))

  return(patents) 
}

#BEGIN RUN

#set some text for the owner you want to search for.
owner = "microsoft"

#run the function and store results as a list of lists
results <- search_by_owner(owner)

results_dataframe <- results_to_dataframe(results)

