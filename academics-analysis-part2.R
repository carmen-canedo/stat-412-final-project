# Joseph Bernardi

library(tidyverse)
library(ggplot2)
library(ggthemes)

participationdata <- read.csv("participation_data.csv")

# Condense data to get total sports participation for each state, for the 2018/2019 school year
participationdata <- participationdata %>%
  subset(year = "2018/2019") %>%
  select(state, boys_participation, girls_participation) %>%
  group_by(state) %>%
  summarise(state.boys_partic = sum(boys_participation), state.girls_partic = sum(girls_participation)) %>%
  na.omit()

statepopdata <- read.csv("https://raw.githubusercontent.com/JoshData/historical-state-population-csv/primary/historical_state_population_by_year.csv")

# Adjust state participation by state population
statepopdata <- statepopdata %>%
  rename("state" = "AK", "Population" = X135000) %>%
  subset(X1950 == 2019) %>%
  select(state, Population)

percap.participation <- participationdata %>%
  inner_join(statepopdata, by = "state") %>%
  group_by(state) %>%
  summarise(boys.participation.percapita = state.boys_partic / Population, girls.participation.percapita = state.girls_partic / Population, total.participation.percapita = (state.boys_partic + state.girls_partic) / Population, Population) %>%
  pivot_longer(cols = c(boys.participation.percapita, girls.participation.percapita), names_to = "Gender", values_to = "Per Capita Participation")

# Plot for participation by state and gender
ggplot(data=percap.participation, aes(x=state, y=`Per Capita Participation`, fill=Gender)) +
  geom_bar(stat="identity", width = 0.8, position=position_dodge(width = 0.8)) + theme(axis.text=element_text(size=7, angle=45), legend.position="bottom") + scale_fill_discrete(name = "Gender", labels = c("Boys Participation", "Girls Participation")) + ggtitle("Sports Participation(Per Capita) by State and Gender in 2019")

ggplot(data=percap.participation, aes(x=state, y=total.participation.percapita)) + theme_calc() + geom_bar(stat="identity", width = 0.6, fill = "dark green") + theme(axis.text=element_text(size=7, angle=45)) + ggtitle("Sports Participation (Per Capita) by State in 2019")

SAT_data <- read.csv("SAT_data.csv")

Sports.vs.SAT <- percap.participation %>%
  inner_join(SAT_data, by = "state") %>%
  select(state, total.participation.percapita, tooktest, avg_score, Population) %>%
  unique() %>%
  group_by(state) %>%
  summarise(tooktest.percapita = tooktest / Population, total.participation.percapita, avg_score, tooktest, Population)

Sports.vs.SAT %>%
  ggplot(aes(x = reorder(state, total.participation.percapita), y = tooktest.percapita)) + theme_calc() + geom_bar(stat="identity", width = 0.6, fill = "dark red") + theme(axis.text=element_text(size=7, angle=45)) + ggtitle("Sports Participation VS SAT Enrollment") + xlab("States from Least to Greatest in Sports Participation Per Capita")


Sports.vs.SAT %>%
  ggplot(aes(x = total.participation.percapita, y = tooktest.percapita, group = 1)) + theme_calc() + geom_line(stat="identity", width = 0.6, color = "dark red") + geom_point() + geom_text(aes(label=state), size = 3, hjust=-0.3, vjust=0) + theme(axis.text=element_text(size=7, angle=45)) + ggtitle("Sports Participation VS SAT Enrollment") + xlab("Sports Participation Per Capita")

Sports.vs.SAT %>%
  group_by(state) %>%
  summarise(sport.score_ratio = total.participation.percapita / avg_score, Population, total.participation.percapita, avg_score) %>%
  ggplot(aes(x = reorder(state, total.participation.percapita), y = avg_score)) + theme_calc() + geom_bar(stat="identity", width = 0.6, fill = "dark blue") + theme(axis.text=element_text(size=7, angle=45)) + ggtitle("Sports Participation VS Average SAT Score") + xlab("States from Least to Greatest in Sports Participation Per Capita")

Sports.vs.SAT %>%
  group_by(state) %>%
  summarise(sport.score_ratio = total.participation.percapita / avg_score, Population, total.participation.percapita, avg_score) %>%
  ggplot(aes(x = total.participation.percapita, y = avg_score, group = 1)) + geom_point() + geom_text(aes(label=state), size = 3, hjust=-0.3, vjust=0) + theme_calc() + geom_line(stat="identity", width = 0.6, color = "dark blue") + theme(axis.text=element_text(size=7, angle=45)) + ggtitle("Sports Participation VS Average SAT Score") + xlab("Sports Participation Per Capita")