library(dplyr)

Totalseats <- read.csv(here::here("data-raw/Totalseats.csv"))
Totalseats <- Totalseats %>% tbl_df()
save(Totalseats, file = "data/Totalseats.rda")