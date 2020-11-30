library(tidyverse)
library(lubridate)
library(reshape2)
library(RColorBrewer)
library(wesanderson)

sport <- read_csv("data/general-data/MajorSports.csv")
enroll <- read_csv("data/general-data/Enrollment.csv")
cost <- read_csv("data/cost-data/Cost_to_Play.csv")
