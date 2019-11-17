
library(csv)
library(here)
library(dplyr)
library(purrr)
library(readxl)
library(ggplot2)
library(scales)
library(knitr)

Legislative_Election <- read.csv(here::here("data-raw/Party in Legislative Election.csv"))
Legislative_Election <- Legislative_Election %>% tbl_df()
save(Legislative_Election, file ="data/Legislative_Election.rda")
