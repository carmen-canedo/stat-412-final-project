# Carmen Canedo
# Script for loading in participation and injury data
library(tidyverse)

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

# Loading in extra injury data
## 2018-2019 data
injuries_by_sport_2018 <- read_csv("./data/injury-data/RIO-individuals/2018-19/2018-injuries-by-sport.csv")
boys_basketball_details <- read_csv("./data/injury-data/RIO-individuals/2018-19/boys-basket-details.csv")
boys_soccer_details <- read_csv("./data/injury-data/RIO-individuals/2018-19/boys-soccer-details.csv")
football_details <- read_csv("./data/injury-data/RIO-individuals/2018-19/football-details.csv")
girls_basketball_details <- read_csv("./data/injury-data/RIO-individuals/2018-19/girls-basket-details.csv")
girls_soccer_details <- read_csv("./data/injury-data/RIO-individuals/2018-19/girls-soccer-details.csv")
participation_by_gender_grade <- read_csv("./data/injury-data/RIO-individuals/2018-19/participation-by-gender-grade.csv")
participation_by_sport_grade <- read_csv("./data/injury-data/RIO-individuals/2018-19/participation-by-grade-sport.csv")
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

# Cleaning data
transform_data <- function(tbl) {
  new_tbl <- tbl %>%
    drop_na() %>%
    #select(-starts_with("x"))
    rename_with(~ str_replace_all(.x,
                                  pattern = " ", replacement = "_")) %>%
    rowwise()
  return(new_tbl)
}

tbls <- list(all_boys_athletes_states, all_boys_programs_states, girl_athletes_states, girl_programs_states, boys_programs_top10, boys_participation_top10, 
             girls_programs_top10, girls_participation_top10, participation_count_1971_2019, sports_participation_states, injuries_by_sport_2018,
             boys_basketball_details, boys_soccer_details, football_details, girls_basketball_details, girls_soccer_details, participation_by_gender_grade,
             participation_by_sport_grade, softball_details, volleyball_details, body_parts_by_year, diagnosis_by_year, injury_rates_by_sports_year,
             most_common_injuries_all, natl_injury_estimates, natl_injury_estimates, surgery_stats, time_loss)

map_df(tbls, transform_data)
