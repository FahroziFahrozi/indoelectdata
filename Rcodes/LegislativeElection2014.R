library(eechidna)
library(plyr)
library(dplyr)
library(purrr)
library(purrrlyr)
library(knitr)
library(broom)
library(readxl)
View(Data_Fahrozi)
glimpse(Data_Fahrozi)
head(Data_Fahrozi) %>% 
  kable
who_won <- Data_Fahrozi %>%
  group_by(PartyNm) %>%
  tally() %>%
  arrange(desc(n))
who_won %>%
  kable()
library(ggplot2)
library(scales)
ggplot(who_won, 
       aes(reorder(PartyNm, n),
n)) +
geom_point(size = 2)+
coord_flip() +
scale_y_continuous(labels = comma) +
theme_bw() +
ylab("Total number of electorates") + 
xlab("Party") +
theme(text = element_text(size=10))
glimpse(totalvotes)
totalvotes <- totalvotes %>% mutate(Votes=as.numeric(Votes))
total_votes_for_parties <- totalvotes %>%
  select(PartyNm, Votes) %>%
  group_by(PartyNm) %>%
  summarise(tvotes = sum(Votes)) %>%
  ungroup() %>%
  arrange(desc(tvotes))
total_votes_for_parties %>%
  head %>%
  kable
ggplot(total_votes_for_parties,
       aes(reorder(PartyNm, tvotes),
           tvotes)) +
geom_point(size = 2) +
coord_flip() +
scale_y_continuous(labels = comma) +
theme_bw() +
ylab("Total votes") +
xlab("Party") +
theme(text = element_text(size=10))
glimpse(Totalseats)
Totalseats <- Totalseats %>% mutate(Totseats=as.numeric(Totseats))
Total_seats_for_parties <- Totalseats %>%
  select(PartyNm, Totseats) %>%
  group_by(PartyNm) %>%
  summarise(tot_seats = sum(Totseats)) %>%
  ungroup() %>%
  arrange(desc(tot_seats))
Total_seats_for_parties %>%
  head %>%
  kable
ggplot(Total_seats_for_parties,
       aes(reorder(PartyNm, tot_seats),
           tot_seats)) +
  geom_point(size = 2) +
  coord_flip() +
  scale_y_continuous(labels = comma) +
  theme_bw() +
  ylab("Total seats") +
  xlab("Party") +
  theme(text = element_text(size=10))
Total_seats_for_provinces <- Totalseats %>%
  select(Provinces, Totseats) %>%
  group_by(Provinces) %>%
  summarise(tot_seats = sum(Totseats)) %>%
  ungroup() %>%
  arrange(desc(tot_seats))
Total_seats_for_provinces %>%
  head %>%
  kable
ggplot(Total_seats_for_provinces,
       aes(reorder(Provinces, tot_seats),
           tot_seats)) +
  geom_point(size = 2) +
  coord_flip() +
  scale_y_continuous(labels = comma) +
  theme_bw() +
  ylab("Total seats") +
  xlab("Provinces") +
  theme(text = element_text(size=10))




       
       