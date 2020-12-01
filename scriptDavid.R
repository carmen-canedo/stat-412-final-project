

library(tidyverse)
library(ggplot2)
library(readxl)
library(kableExtra)
library(ggthemes)
library(lubridate)


MakeBoysRegionPlot <- function(Region){  #Makes Plot of Boys Participation in HS Soccer by Region
  gbsoccer %>%
    filter(gbsoccerPLOT$Region == Region) %>%
    ggplot() +
    geom_col(aes(x = Year, y = `Boys Participation`, group = 1), fill = "#0DCBF3") +
    guides(fill = FALSE) +
    theme(axis.text.x = element_text(angle = 45, vjust = (1.1), hjust = (1.1))) +
    labs(title = "Boys HS Soccer Participation by Region", x = "Season", y = "Amount of Boys", subtitle = Region)
}

MakeGirlsRegionPlot <- function(Region){  #Makes Plot of Boys Participation in HS Soccer by Region
  gbsoccer %>%
    filter(gbsoccerPLOT$Region == Region) %>%
    ggplot() +
    geom_col(aes(x = Year, y = `Girls Participation`, group = 1), fill = "#0FE935") +
    guides(fill = FALSE) +
    theme(axis.text.x = element_text(angle = 45, vjust = (1.1), hjust = (1.1))) +
    labs(title = "Girls HS Soccer Participation by Region", x = "Season", y = "Amount of Girls", subtitle = Region)
}






#ggplot(gbsoccer1a) +    ### Smushed the two graphs together onto one plane, deleted for various reasons

 # geom_col(aes(x = Year, y = Girls_change), fill = "#F2312E") +
  #guides(fill=FALSE) +
  #geom_line(aes(x = Year, y = Girls_change, group = 1), color= "#037EFC", size = 1.5) +
  #theme(axis.text.x = element_text(angle = 45, vjust = (1.1), hjust = (1.1))) + 
  #labs(title = "Annual Change in Schools offering Girls Soccer Programs", x = "Season", y = "Percent Change") +
  #geom_line(aes(x = Year, y = Girls_School, group = 1), color = "orange", size = 1.5) +
  #scale_y_continuous(sec.axis = sec_axis(~./3, name = "Amount of Girls (in thousands)"))
```