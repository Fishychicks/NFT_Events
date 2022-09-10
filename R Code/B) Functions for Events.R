rm(list=ls())   
library(data.table)
source("R Code/A) Columns Selection.R" )

# This function helps to breakdown Estate events into individual Component
ESTATE_EVENTS <- function(Sample_data1 = Events_data1 ){
  
  Estate_Data_Final <- data.table()
  for(i in 1:nrow(Sample_data1)){
    # Check if an Estate Exist
    Sample_data1[, asset_bundle.assets[i]] -> Estate_Data
    
    if(nrow(Estate_Data) != 0){
      Estate_Data[ , ..Layer_2_Estates] -> Estate_Data
      TMP_Data_NAME <- names(Estate_Data) 
      names(Estate_Data) <- paste("asset", TMP_Data_NAME, sep = ".")
      # cat(i, "\n")
      TMP_Data_NAME <- names(Estate_Data) 
      Sample_data1[i] -> Info_for_Estate
      do.call("rbind", replicate(nrow(Estate_Data), Info_for_Estate, simplify = FALSE)) -> Estate_Data_SKELETON
      suppressWarnings(Estate_Data_SKELETON[ , (TMP_Data_NAME) := .(rep( NULL, length(Layer_2_Estates))) ])
      
      Estate_Data_SKELETON <- cbind(Estate_Data_SKELETON, Estate_Data)
      Estate_Data_SKELETON[, ..Layer_1_events_Info ] -> Estate_Data
      Estate_Data[, LAND_TYPE := paste(sqrt(nrow(Estate_Data)), "x", sqrt(nrow(Estate_Data)) , sep ="")] -> Estate_Data
      Estate_Data_Final <- rbind(Estate_Data_Final, Estate_Data)
    }
  }
  
  Sample_data1[!is.na(asset.id)] -> Sample_data1
  Sample_data1[, LAND_TYPE := "1x1"]
  
  Final_Data <- rbind(Sample_data1, Estate_Data_Final)
  return(Final_Data)
}

API_CALL_FOR_EVENTS <- function(
    TIME_IND = as.numeric(Sys.time()) ,
    TIME_STOP = as.numeric(as.POSIXct("2022-08-31T00:00:00", format = "%Y-%m-%dT%H:%M:%S", tz = "GMT")), # Final Date  
    asset_address = "0x5CC5B05a8A13E3fBDB0BB9FcCd98D38e50F90c38"
  ) {
  FINAL_DATA <- data.table() # <- Setup of object to capture final data
    while(TIME_IND > TIME_STOP){
    url <- queryString <- list(
        limit                  = 300,
        asset_contract_address = asset_address,
        event_type             = "successful", 
        occurred_before        = TIME_IND,
        occurred_after         = TIME_STOP
      )
    
    response <- VERB("GET", url = "https://api.opensea.io/api/v1/events", add_headers('X-API-KEY' = '921815938aa149ebb18da7c325379c86'), 
                     query = queryString, content_type("application/octet-stream"), accept("application/json"))
    
    dataOpenSea <-fromJSON(rawToChar(response$content), flatten=TRUE)
    Events_data1 <- dataOpenSea$asset_events; 
    setDT(Events_data1)
    
    if(nrow(Events_data1) == 0 )
      break
    
    if(!any(names(Events_data1) %in% "asset_bundle.assets")){
      Events_data1[ , asset_bundle.assets := list()] 
    }
    
    Events_data1[ , ..Layer_1_events_Info] -> Events_data1
    
    Events_AND_ESTATE_data1 <- ESTATE_EVENTS(Events_data1)
    Events_AND_ESTATE_data1[ , event_timestamp := as.POSIXct(event_timestamp, 
                                                             format = "%Y-%m-%dT%H:%M:%S", tz = "GMT")]
    
    TIME_IND <- min(Events_AND_ESTATE_data1$event_timestamp)
    print(TIME_IND)
    TIME_IND <- as.numeric(TIME_IND)
    FINAL_DATA <- rbind(FINAL_DATA, Events_AND_ESTATE_data1)
      
  }
  return(FINAL_DATA)
}

# API_CALL_FOR_EVENTS() -> x
