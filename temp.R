libary(historydata)


head(historydata::us_state_populations)

head(historydata::us_national_population)



library(gapminder)

test <- (gapminder::gapminder)


plot(test$lifeExp, test$gdpPercap)

plot()


library(tidyverse)


tibYearAH <- as_tibble(seq(0, 2000, 1)) %>%
  rename(yearAH = value) %>%
  mutate(yearCE = as.integer(yearAH-(yearAH/33)+622)) %>%
  mutate(from = paste0(yearAH, "AH")) %>%
  mutate(to = paste0(yearAH, "/", yearCE)) %>%
  select(from, to)

write_delim(tibYearAH, "from_AH_to_CE.csv", delim=",")

tibYearCE <- as_tibble(seq(622, 2500, 1)) %>%
  rename(yearCE = value) %>%
  mutate(yearAH = as.integer(((yearCE-622)*33)/32)) %>%
  mutate(from = paste0(yearCE, "CE")) %>%
  mutate(to = paste0(yearAH, "/", yearCE)) %>%
  select(from, to)

write_delim(tibYearCE, "from_CE_to_AH.csv", delim=",")
