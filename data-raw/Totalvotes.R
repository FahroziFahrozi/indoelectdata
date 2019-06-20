library(dplyr)

totalvotes <- read.csv(here::here("data-raw/Total Votes percandidates.csv"))
totalvotes <- totalvotes %>% tbl_df()
save(totalvotes, file = "data/totalvotes.rdata")