rm(list = ls())
source("R Code/B) Functions for Events.R")

asset_address <- "0x5CC5B05a8A13E3fBDB0BB9FcCd98D38e50F90c38"
# TIME_Upper_Bound = as.numeric(Sys.time()) # Current Time
# Time_Lower_Bound <- as.numeric(as.POSIXct("2023-01-31T00:00:00", format = "%Y-%m-%dT%H:%M:%S", tz = "GMT"))

TIME_IND = as.numeric(Sys.time()) # Current Time
TIME_STOP <- as.numeric(as.POSIXct("2023-01-01T00:00:00", format = "%Y-%m-%dT%H:%M:%S", tz = "GMT"))

#####################################################
# 01 - Events Call                                  #
#####################################################
API_CALL_FOR_EVENTS(TIME_IND      = TIME_IND,
                    TIME_STOP     = TIME_STOP,
                    asset_address = asset_address
                    ) -> Events_Call


