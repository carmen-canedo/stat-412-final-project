# Carmen Canedo
# Script for using injury-analysis.Rmd

# Knitting Preferences
knitr::opts_chunk$set(echo = FALSE, warning = FALSE, message = FALSE)

# Script for loading in participation and injury data
library(tidyverse)
library(lubridate)
library(stringi)

# Loading in participation data
all_boys_athletes_states <- read_csv("./data/injury-data/participation/all-boys-athletes-state.csv")
all_boys_programs_states <- read_csv("./data/injury-data/participation/all-boys-programs-state.csv")
girl_athletes_states <- read_csv("./data/injury-data/participation/all-girls-athletes-state.csv")
girl_programs_states <- read_csv("./data/injury-data/participation/all-girls-programs-state.csv")
boys_programs_top10 <- read_csv("./data/injury-data/participation/boys-programs-top10.csv")
boys_participation_top10 <- read_csv("./data/injury-data/participation/boys-top10-participation.csv")
girls_programs_top10 <- read_csv("./data/injury-data/participation/girls-programs-top10.csv")
girls_participation_top10 <- read_csv("./data/injury-data/participation/girls-top10-participation.csv")
participation_count_1971_2019 <- read_csv("./data/injury-data/participation/participation-count-1971-2019.csv")
sports_participation_states <- read_csv("./data/injury-data/participation/sports-part-by-state.csv")
participation_by_gender_grade <- read_csv("./data/injury-data/RIO-individuals/2018-19/participation-by-gender-grade.csv")
participation_by_sport_grade <- read_csv("./data/injury-data/RIO-individuals/2018-19/participation-by-grade-sport.csv")

# Loading in extra injury data
## Original datasets
youth_ed_tbi_visits <- read_csv("data/injury-data/ed-visits-among-us-children-for-sports-related-brain-injury-2010-2016-by-sport.csv")
general_ed_visits <- read_csv("data/injury-data/us-annual-average-emergency-department-visits-for-sports-injuries-2010-2016-by-age.csv")
sport_ed_visits <- read_csv("data/injury-data/us-emergency-department-visits-ages-5-24-2010-2016-by-gender-and-activity.csv")
num_concussions_2017 <- read_csv("data/injury-data/number-of-concussions-suffered-by-us-youth-that-played-sports-as-of-2017-by-gender.csv")
survey_tbi_effects <- read_csv("data/injury-data/survey-on-concussions-suffered-in-sports-and-long-term-brain-damage---effects-2014.csv")
female_college_sports <- read_csv("data/injury-data/annual-number-of-us-college-female-sports-injuries-during-fall-season-2009-2014.csv")
male_college_sports <- read_csv("data/injury-data/average-number-of-male-sports-injuries-during-us-college-fall-season-2009-2014.csv")
avg_college_sports <- read_csv("data/injury-data/annual-number-of-college-sports-injuries-in-the-us-by-gender-2009-2014.csv")

## 2018-2019 data
injuries_by_sport_2018 <- read_csv("./data/injury-data/RIO-individuals/2018-19/2018-injuries-by-sport.csv")
boys_basketball_details <- read_csv("./data/injury-data/RIO-individuals/2018-19/boys-basket-details.csv")
boys_soccer_details <- read_csv("./data/injury-data/RIO-individuals/2018-19/boys-soccer-details.csv")
football_details <- read_csv("./data/injury-data/RIO-individuals/2018-19/football-details.csv")
girls_basketball_details <- read_csv("./data/injury-data/RIO-individuals/2018-19/girls-basket-details.csv")
girls_soccer_details <- read_csv("./data/injury-data/RIO-individuals/2018-19/girls-soccer-details.csv")
softball_details <- read_csv("./data/injury-data/RIO-individuals/2018-19/softball-details.csv")
volleyball_details <- read_csv("./data/injury-data/RIO-individuals/2018-19/volleyball-details.csv")

## Data covering more than one year
body_parts_by_year <- read_csv("./data/injury-data/RIO-individuals/all-years/body-part-by-year.csv")
diagnosis_by_year <- read_csv("./data/injury-data/RIO-individuals/all-years/diagnosis-by-year.csv")
injury_rates_by_sports_year <- read_csv("./data/injury-data/RIO-individuals/all-years/injury-rates-by-sports-year.csv")
most_common_injuries_all <- read_csv("./data/injury-data/RIO-individuals/all-years/most-common-injuries-all.csv")
natl_injury_estimates <- read_csv("./data/injury-data/RIO-individuals/all-years/natl-inj-est-by-year.csv")
surgery_stats <- read_csv("./data/injury-data/RIO-individuals/all-years/surgery-required.csv")
time_loss <- read_csv("./data/injury-data/RIO-individuals/all-years/time-loss.csv")

# Saving list of injury data frames by sport
sports_injuries_type <- list(boys_basketball_details, boys_soccer_details, football_details, girls_basketball_details,
                             girls_soccer_details, softball_details, volleyball_details)


# Function for narrowing down injuries
combine_injury_totals <- function(tbl) {
  
  tbl <- tbl %>% 
    filter(Activity == "Total")
  
}

