rm(list = ls())
source("R Code/B) Functions for Events.R")

asset_add <- "0x5CC5B05a8A13E3fBDB0BB9FcCd98D38e50F90c38"
TIME_Upper_Bound = as.numeric(Sys.time()) # Current Time
Time_Lower_Bound <- as.numeric(as.POSIXct("2022-08-31T00:00:00", format = "%Y-%m-%dT%H:%M:%S", tz = "GMT"))

#####################################################
# 01 - Events Call                                  #
#####################################################
API_CALL_FOR_EVENTS(TIME_IND      = TIME_Upper_Bound,
                    TIME_STOP     = Time_Lower_Bound,
                    asset_address = asset_add
                    ) -> Events_Call
