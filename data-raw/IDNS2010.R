#this scripts creates the IDNS2010 data frame from Indonesia census 2010 datapacks
#I used the latest data updated in 2015 till 2018
#this census data not used all of the categories from census just choose the categories that interest to show
#https://www.bps.go.id/publication/2010/12/23/b0adeb45e05c3db10ac99f33/statistik-indonesia-2010.html

library(tidyverse)
library(readxl)

IDN_Codearea <- read_csv("data-raw/2015 Census Data Indonesia/Code Area.csv")
IDN_Household <- read_csv("data-raw/2015 Census Data Indonesia/Household 2015.csv")
IDN_Income <- read_csv("data-raw/2015 Census Data Indonesia/Income based on type of jobs.csv")
IDN_Medianage <- read_csv("data-raw/2015 Census Data Indonesia/Median age female married.csv")
IDN_Rcpr <- read_csv("data-raw/2015 Census Data Indonesia/Ratio of Crude Participation Rate in univ 2015.csv")
IDN_Population <- read_csv("data-raw/2015 Census Data Indonesia/TotalPopulation.csv")
IDN_Unemployment <- read_csv("data-raw/2015 Census Data Indonesia/Unemployment rate.csv")
IDN_PopuProjection <- read_csv("data-raw/2015 Census Data Indonesia/indo_12  population projection 2015.csv")

new <- IDN_Household %>% mutate(
  ID = substr(CA2015, 3, 4),
  
  #IDNS01
  PopulationIDN = IDN_Population$total,
  PopulationMen = IDN_Population$Men,
  PopulationWomen = IDN_Population$Women,
  
  #IDNS02
  Household = IDN_Household$TotalHousehold,
  
  #IDNS03
  Incomeff = IDN_Income$farmersandfisherman,
  Incomemerchant = IDN_Income$merchant,
  Incomegov = IDN_Income$governmentemployees,
  Incomepriv = IDN_Income$privateemployees,
  Incomeentrep = IDN_Income$entrepreneur,
  Incomefreelancer = IDN_Income$freelancer,
  
  #IDNS04
  Medianage = IDN_Medianage$Medianage,
  
  #IDNS05
  RatioParticp = IDN_Rcpr$RCPR2015,
  
  #IDNS06
  Unemployment2015 = IDN_Unemployment$Unemploymentrate2015,
  Unemployment2016 = IDN_Unemployment$Unemploymentrate2016,
  Unemployment2017 = IDN_Unemployment$Unemploymentrate2017,
  Unemployment2018 = IDN_Unemployment$Unemploymentrate2018,
  
  #IDNS07
  PopulationProjection2010 = IDN_PopuProjection$Populationprojection2010,
  PopulationProjection2015 = IDN_PopuProjection$Populationprojection2015,
  PopulationProjection2020 = IDN_PopuProjection$Populationprojection2020,
  PopulationProjection2025 = IDN_PopuProjection$Populationprojection2025,
  PopulationProjection2030 = IDN_PopuProjection$Populationprojection2030,
  PopulationProjection2035 = IDN_PopuProjection$Populationprojection2035)
  
  #Join two dataset
  codearea <- IDN_Codearea
  new <- new %>% mutate(ID =as.numeric(ID)) %>%
    left_join(codearea,new, by = "ID")
    
  
  IDNS2010 <- new %>%
    filter(!is.na(Provinces)) %>%
    select(-c(ends_with("_U"), ends_with("_H"), CA2015))
    
  IDNS2010 <- IDNS2010 %>%
    select(ID, Provinces, PopulationIDN, everything())%>%
    mutate(ID = as.numeric(ID))

    
save(IDNS2010, file = "data/IDNS2010.rda")