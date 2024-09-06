library(tidyverse)

USArrests %>% head()
USArrests%>% tail()
USArrests %>% glimpse()

USArrests$state <- rownames(USArrests)
rownames(USArrests) <- NULL

names(USArrests) <- tolower(names(USArrests))

USArrests %>%
  select(assault, state) %>%
  filter(grepl("New", state)) %>%
  arrange(desc(assault)) %>%
  summarise(sum_assault = sum(assault),
            mean_assault = mean(assault),
            median_assault = median(assault),
            sd_assault = sd(assault),
            n=n())

USArrests %>%
  filter(rape > 15 | urbanpop < 40) %>%
  filter(grepl("^A", state)) %>%
  arrange(desc(rape), desc(urbanpop))

USArrests %>%
  select(rape, state) %>%
  mutate(index = ifelse(rape <= 10, "low", "high")) %>%
  arrange(desc(rape)) %>%
  head(10) %>%
  mutate(contribution = rape/sum(rape))

USArrests %>%
  mutate(total_crime = murder+assault+urbanpop+rape) %>%
  arrange(desc(total_crime)) %>%
  mutate(contribution = total_crime/sum(total_crime)) %>%
  head(10) %>%
  select(state, total_crime, contribution)

df1 <- USArrests %>%
  mutate(total_crime = murder+assault+urbanpop+rape) %>%
  arrange(desc(total_crime)) %>%
  mutate(contribution = total_crime/sum(total_crime)) %>%
  head(10) %>%
  select(state, total_crime, contribution)

df1 %>%
  filter(grepl("a", state)) %>%
  summarise(mean_total_crime = mean(total_crime),
            sum_total_crime = sum(total_crime))
